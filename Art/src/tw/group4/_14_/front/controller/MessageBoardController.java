package tw.group4._14_.front.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.Base64;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import tw.group4._14_.back.ARTProduct;
import tw.group4._14_.back.dao.ProductBeanDAOService;
import tw.group4._14_.front.model.MBRecordBean;
import tw.group4._14_.front.model.MessageBoardAP;
import tw.group4._14_.front.model.dao.MBRecordDAOService;
import tw.group4._14_.front.model.dao.MessageBoardAPService;
import tw.group4._14_.front.util.MBRecordUtil;
import tw.group4._35_.login.model.WebsiteMember;
import tw.group4._35_.login.model.WebsiteMemberService;
import tw.group4.util.Hibernate;

@Controller
public class MessageBoardController {

	@Autowired
	private MessageBoardAPService mbService;

	@Autowired
	private WebsiteMemberService wmService;

	@Autowired
	private ProductBeanDAOService pdService;

	@Autowired
	private MBRecordDAOService mbrService;

	@Autowired
	private MBRecordUtil util;

	@Autowired
	ServletContext ctx;
	
	
	@Hibernate
	@RequestMapping(path = "/14/showMessage/{apid}.ctrl")
	@ResponseBody
	public List<MessageBoardAP> showMessage(@PathVariable(name = "apid") int apid) {

		List<MessageBoardAP> list = mbService.selectPdBoardAPs(apid);

		return list;

	}
	
	@Hibernate
	@RequestMapping(path = "/14/editMessage")
	@ResponseBody
	public List<MessageBoardAP> editMessage(@RequestParam(name = "apid") int apid, @RequestParam(name = "mbid") int mbid, @RequestParam(name = "content") String content ) {

		MessageBoardAP selectMessage = mbService.selectMessage(mbid);
		selectMessage.setContent(content);
		mbService.updateMessage(selectMessage);
		
		List<MessageBoardAP> list = mbService.selectPdBoardAPs(apid);
		
		return list;

	}
	
	
	@Hibernate
	@RequestMapping(path = "/14/saveMessage/{apid}.ctrl")
	@ResponseBody
	public String saveMessage(@PathVariable(name = "apid") int apid, HttpSession session,
			@RequestParam(name = "name") String name,
			@RequestParam(name = "subjectAP", required = false) String subjectAP,
			@RequestParam(name = "editor") String content, @RequestParam(name = "rate", required = false) int rate) {

		WebsiteMember mb = (WebsiteMember) session.getAttribute("member");
		int memberID = mb.getId();
		Date today = new Date();
		MessageBoardAP mbAP = new MessageBoardAP();

		System.out.println("aaaaaaaaaaaaaa=" + content);
//		WebsiteMember member = wmService.selectById(memberID);
//		Blob memberPic = member.getMemberPic();
//		byte[] memberPicByte = null;
//		try {
//			memberPicByte = memberPic.getBytes(1, (int) memberPic.length());
//			base64Str = Base64.getEncoder().encodeToString(memberPicByte);
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}

		mbAP.setApId(apid);
		mbAP.setContent(content);
		mbAP.setMemberId(Integer.toString(memberID));
		mbAP.setSubjectAP("/Art/14/getBlobImageMessage/" + memberID + "/.ctrl");
		mbAP.setScore(rate); // 忘記為什麼反正要減1，不要減1
		mbAP.setScoreString("/Art/14/getStarImageMB/" + rate + ".ctrl");
		mbAP.setTime(today);

		mbService.insert(mbAP);

		List<MessageBoardAP> list = mbService.selectPdBoardAPs(apid);

		ARTProduct ap = pdService.select(Integer.toString(apid));
		ap.setProductScore(ap.getProductScore() + rate);
		ap.setProductRater(ap.getProductRater() + 1);
		pdService.updateProduct(ap);

		Long count = mbService.countMessageNum(apid);

		util.MBRCtrlDecrease(memberID, apid);

		Gson gson = new Gson();

		String json = gson.toJson(list);

		return json;

	}
	@Hibernate
	@RequestMapping(path = "/14/getBlobImageMessage/{mbid}/.ctrl")
	@ResponseBody
	public ResponseEntity<byte[]> getMessageBlobImage(@PathVariable(name = "mbid") int mbid) {
		ResponseEntity<byte[]> re = null;
		WebsiteMember member = wmService.selectById(mbid);
		Blob memberPic = member.getMemberPic();

		byte[] b = null;

		try {
			Long length = memberPic.length();
			b = memberPic.getBytes(1, length.intValue());
		} catch (SQLException e) {
			e.printStackTrace();
		}

		String mimeType = ctx.getMimeType("ThisIsFake.jpg");
		MediaType mediaType = MediaType.valueOf(mimeType);
		HttpHeaders headers = new HttpHeaders();

		try {
			headers.setContentType(mediaType);
			headers.setCacheControl(CacheControl.noCache().getHeaderValue()); // 設定取消 cache
			re = new ResponseEntity<byte[]>(b, headers, HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return re;

	}

	@Hibernate
	@RequestMapping(path = "/14/MBloginCheck/{apid}.ctrl")
	@ResponseBody
	public int MBloginCheck(HttpSession session, @PathVariable(name = "apid") int apid) {

		WebsiteMember mb = (WebsiteMember) session.getAttribute("member");
		if (mb == null) {
			return 0;

		} else {

			Integer mid = mb.getId();
			int result = mbrService.searchMessage(mid, apid);
			System.out.println("+++++++++++++++" + result);
			if (result > 0) {
				MBRecordBean mbr = mbrService.selectMessage(mid, apid);
				int a = mbr.getStatus(); // 這裡跟上面那行是一組的
				if (a > 0) {

					return 1;

				} else {
					return 0;
				}

			} else {
				return 0;
			}
		}

	}
	@Hibernate
	@RequestMapping(path = "/14/getStarImageMB/{rate}.ctrl")
	@ResponseBody
	public ResponseEntity<byte[]> getStarImage(@PathVariable(name = "rate") int rate) throws IOException {

		ResponseEntity<byte[]> re = null;

		String mimeType = ctx.getMimeType("ThisIsFake.jpg");
		MediaType mediaType = MediaType.valueOf(mimeType);
		HttpHeaders headers = new HttpHeaders();
		InputStream inputStream = null;
		byte[] readAllBytes = null;

		if (rate < 2) {

			inputStream = new FileInputStream(ctx.getRealPath("/WEB-INF/pages/images/star_1.jpg"));
			readAllBytes = inputStream.readAllBytes();

		} else if (rate < 3) {
			inputStream = new FileInputStream(ctx.getRealPath("/WEB-INF/pages/images/star_2.jpg"));
			readAllBytes = inputStream.readAllBytes();

		} else if (rate < 4) {

			inputStream = new FileInputStream(ctx.getRealPath("/WEB-INF/pages/images/star_3.jpg"));
			readAllBytes = inputStream.readAllBytes();

		} else if (rate < 5) {

			inputStream = new FileInputStream(ctx.getRealPath("/WEB-INF/pages/images/star_4.jpg"));
			readAllBytes = inputStream.readAllBytes();

		} else {

			inputStream = new FileInputStream(ctx.getRealPath("/WEB-INF/pages/images/star_5.jpg"));
			readAllBytes = inputStream.readAllBytes();

		}

		try {
			headers.setContentType(mediaType);
			headers.setCacheControl(CacheControl.noCache().getHeaderValue()); // 設定取消 cache
			re = new ResponseEntity<byte[]>(readAllBytes, headers, HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return re;

	}
	@Hibernate
	@RequestMapping(path = "/14/getMemberId.ctrl")
	@ResponseBody
	public int getMemberId(HttpSession session) {
		WebsiteMember mb = (WebsiteMember) session.getAttribute("member");

		if (mb == null) {
			return 0;

		} else {

			Integer mid = mb.getId();
			return mid;

		}

	}
}
