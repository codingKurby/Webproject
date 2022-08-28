package com.spring.bread.controller;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.bread.dto.PageMakerDTO;
import com.spring.bread.mapper.AttachMapper;
import com.spring.bread.model.AttachImageVo;
import com.spring.bread.model.Criteria;
import com.spring.bread.model.ProductVo;
import com.spring.bread.model.ReplyPageVo;
import com.spring.bread.model.ReplyVo;
import com.spring.bread.service.ProductService;

import net.coobird.thumbnailator.Thumbnails;

@Controller


@RequestMapping("/bread/*")
public class ProductController {
	public ProductController() {
		System.out.println("@ProductController : 스프링 자동 생성");
	}

	private static final Logger log = LoggerFactory.getLogger(ProductController.class);

	@Autowired
	private AttachMapper attachMapper;

	@Autowired
	private ProductService bservice;

	@GetMapping("/enroll")
	// => @RequestMapping(value="enroll", method=RequestMethod.GET)
	public void breadEnrollGET() {

		log.info("게시판 등록 페이지 진입");

	}

	/* 게시판 등록 */
	@PostMapping("/enroll")
	public String breadEnrollPOST(ProductVo vo, RedirectAttributes rttr) {

		log.info("ProductVo : " + vo);

		bservice.enroll(vo);

		return "redirect:/bread/list";

	}

	/* 게시판 목록 페이지 접속 */
	// @GetMapping("/list")
	// => @RequestMapping(value="list", method=RequestMethod.GET)
	// public void breadListGET(Model model) {

	// log.info("게시판 목록 페이지 진입");

	// model.addAttribute("list", bservice.getList());

	// }



	/* 게시판 목록 페이지 접속 (페이징 적용) */
	@GetMapping("/list")
	public void breadListGET(Model model, Criteria cri) {

		log.info("breadListGET");

		model.addAttribute("list", bservice.getListPaging(cri));

		int total = bservice.getTotal(cri);

		PageMakerDTO pageMaker = new PageMakerDTO(cri, total);

		model.addAttribute("pageMaker", pageMaker);
	}

	/* 게시판 조회 */
	@GetMapping("/get")
	public void breadGetPageGET(int productId, Model model, Criteria cri) {

		model.addAttribute("pageInfo", bservice.getPage(productId));
		model.addAttribute("cri", cri);

	}

	/* 수정 페이지 이동 */
	@GetMapping("/modify")
	public void breadModifyGET(int productId, Model model, Criteria cri) {

		model.addAttribute("pageInfo", bservice.getPage(productId));
		model.addAttribute("cri", cri);

	}

	/* 페이지 수정 */
	@PostMapping("/modify")
	public String breadModifyPOST(ProductVo vo) {

		bservice.modify(vo);

		return "redirect:/bread/list";

	}

	/* 게시판 삭제 */
	@PostMapping("/delete")
	public String breadDelete(int productId) {

		bservice.delete(productId);

		return "redirect:/bread/list";

	}

	/* 첨부 파일 업로드 ("/bread/uploadajaxAction" url 요청에 응답) */
	@PostMapping(value="/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<AttachImageVo>> uploadAjaxActionPOST(MultipartFile[] uploadFile) {
		//반환 타입이 ResponseEntity 객체이고 Http의 Body에 추가될 데이터는 List <AttachImageVO>
		// MultiparFile: View에서 전송한 multipart 타입의 파일을 다룰 수 있도록 해주는 인터페이스

		log.info("uploadAjaxActionPOST..........");
		/* 이미지 파일 체크 */
		for(MultipartFile multipartFile: uploadFile) {

			File checkfile = new File(multipartFile.getOriginalFilename());
			String type = null;

			log.info(multipartFile.getOriginalFilename());
			try {
				type = Files.probeContentType(checkfile.toPath());
				log.info("MIME TYPE : " + type);
			} catch (IOException e) {
				e.printStackTrace();
			}

			if(!type.startsWith("image")) {

				List<AttachImageVo> list = null;
				return new ResponseEntity<>(list, HttpStatus.BAD_REQUEST);

			}
		}

		String uploadPath = "D:\\bigdata0214\\backend\\jsp\\BreadProject _1.0.0\\src\\main\\webapp\\resources\\img\\";

		/* 이미저 정보 담는 객체 */
		List<AttachImageVo> list = new ArrayList();

		//for문
		for(MultipartFile multipartFile : uploadFile) {

			/* 이미지 정보 객체 */
			AttachImageVo vo = new AttachImageVo();
			/* 파일 이름 */
			//view 로부터 전달 받은전달받은 파일을 지정한 폴더에 저장하기 위해서 MultipartFile 클래스의 transferTo() 메서드를 사용

			//view 로부터 전달받은 파일 이름을 그대로 사용, 파일 경로는 uploadPath
			String originalFileName = multipartFile.getOriginalFilename();
			String uploadFileName = originalFileName.substring(originalFileName.lastIndexOf("\\")+1);
			log.info(uploadFileName);
			//각 정보를 AttachImageVO 객체에 저장
			vo.setFileName(uploadFileName);
			vo.setUploadPath(uploadPath);

			/* 파일 위치, 파일 이름을 합친 File 객체 */
			File saveFile = new File(uploadPath, uploadFileName);

			/* 파일 저장 */ 
			try {
				multipartFile.transferTo(saveFile);
				File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);	

				BufferedImage bo_image = ImageIO.read(saveFile);

				//비율 
				double ratio = 3;
				//넓이 높이
				int width = (int) (bo_image.getWidth() / ratio);
				int height = (int) (bo_image.getHeight() / ratio);					


				Thumbnails.of(saveFile)
				.size(width, height)
				.toFile(thumbnailFile);
			} catch (Exception e) {
				e.printStackTrace();
			} 

			// 이미지 정보가 저장된 AttachImageVO객체를 List의 요소로 추가
			list.add(vo);

			//			log.info("-----------------------------------------------");
			//			log.info("파일 이름 : " + multipartFile.getOriginalFilename()); //파일 이름에 경로가 포함되어 있다
			//			log.info("파일 타입 : " + multipartFile.getContentType());
			//			log.info("파일 크기 : " + multipartFile.getSize());			
		}
		ResponseEntity<List<AttachImageVo>> result = new ResponseEntity<List<AttachImageVo>>(list, HttpStatus.OK);
		return result; 

	}

	@GetMapping("/display") // 이미지 데이터를 전달해주는 매핑 메서드 선언부를 추가(ResponseEntity 객체를 통해 body에 byte [] 데이터를 보내야 하기 대문에 ResponseEntity<byte[]>를 반환 타입으로 작성)
	public ResponseEntity<byte[]> getImage(String fileName){ //'파일 경로' + '파일 이름'을 전달받아야 하기 때문에 String 타입의 fileName 변수를 파라미터로 부여
		log.info("getImage()....."+ fileName);

		File file = new File(fileName);
		ResponseEntity<byte[]> result = null;

		try {

			HttpHeaders header = new HttpHeaders();

			header.add("Content-type", Files.probeContentType(file.toPath()));

			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);

		}catch (IOException e) {
			e.printStackTrace();
		}

		return result;
	}

	//	/* 이미지 파일 삭제 */
	//	@PostMapping("/deleteFile")
	//	public ResponseEntity<String> deleteFile(String fileName){
	//		
	//		log.info("deleteFile........" + fileName);
	//		File file = null;
	//		return null;
	//	}

	/* 이미지 정보 반환 */
	@GetMapping(value="/getAttachList", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<AttachImageVo>> getAttachList(int productId){

		log.info("getAttachList.........." + productId);


		return new ResponseEntity<List<AttachImageVo>>(attachMapper.getAttachList(productId), HttpStatus.OK);

	}
	@GetMapping("/replyEnroll/{memberId}")
	// => @RequestMapping(value="replyEnroll", method=RequestMethod.GET)
	public String replyEnrollWindowGET(@PathVariable("memberId")String memberId,int productId,Model model) {
		ProductVo product = bservice.getProductIdName(productId);
		model.addAttribute("productInfo",product);
		model.addAttribute("memberId",memberId);
		return "bread/replyEnroll";
	}
//	@PostMapping("/replyEnroll")
//	public String breadReplyEnrollPOST(ReplyVo rvo, RedirectAttributes rttr) {
//		log.info("ReplyVo :" + rvo);
//		
//		bservice.replyEnroll(rvo);
//		
//		rttr.addFlashAttribute("result","enroll success");
//		return "redirect:/bread/list";
//	}
	@PostMapping("/replyEnroll")
	public void enrollReplyPOST(ReplyVo rvo) {
		bservice.enrollReply(rvo);
	}
	@PostMapping("/check")
	public String replyCheckPOST(ReplyVo rvo) {
		return bservice.checkReply(rvo);
	}
	/* 댓글 페이징 */
	@GetMapping(value="/replyList", produces = MediaType.APPLICATION_JSON_VALUE)
	public ReplyPageVo replyListPOST(Criteria cri) {
		return bservice.replyList(cri);
	}
	//댓글 수정
	@PostMapping("/replyUpdate")
	public void replyModifyPOST(ReplyVo rvo) {
		bservice.updateReply(rvo);
	}
	
	/* 리뷰 수정 팝업창 */
	@GetMapping("/replyUpdate")
	public String replyUpdateWindowGET(ReplyVo rvo, Model model) {
		ProductVo product = bservice.getProductIdName(rvo.getProductId());
		model.addAttribute("productInfo", product);
		model.addAttribute("replyInfo", bservice.getUpdateReply(rvo.getReplyId()));
		model.addAttribute("memberId", rvo.getMemberId());
		
		return "/replyUpdate";
	}
	/* 댓글 삭제 */
	@PostMapping("/replyDelete")
	public void replyDeletePOST(ReplyVo rvo) {
		bservice.deleteReply(rvo);
	}
	//추가
	@PostMapping("/bread/list")
	public void breadListPOST(Model model, Criteria cri) {

		log.info("breadListPOST");

		model.addAttribute("list", bservice.getListPaging(cri));

		int total = bservice.getTotal(cri);

		PageMakerDTO pageMaker = new PageMakerDTO(cri, total);

		model.addAttribute("pageMaker", pageMaker);
	}

}
