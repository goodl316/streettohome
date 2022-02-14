package egovframework.sth.domain.admin.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import egovframework.sth.domain.admin.domain.AdminMessageDTO;
import egovframework.sth.domain.admin.domain.AskDTO;
import egovframework.sth.domain.admin.domain.BannerDTO;
import egovframework.sth.domain.admin.domain.BoardDTO;
import egovframework.sth.domain.admin.domain.MemberDTO;
import egovframework.sth.domain.admin.domain.ReportDTO;
import egovframework.sth.domain.admin.domain.ReportVO;
import egovframework.sth.domain.admin.domain.StatisticsDTO;
import egovframework.sth.domain.admin.mapper.AdminMapper;
import egovframework.sth.global.common.FileUtils;
import egovframework.sth.global.common.excel.ExcelDownload;
import egovframework.sth.global.common.excel.model.TransactionHistoryDTO;

@Service
public class AdminService {
	
	@Autowired
	private AdminMapper mapper;
	@Autowired
	private FileUtils futils;
	@Autowired
	private HttpSession session;
	@Autowired
	private ExcelDownload excelDownload;
	
	public StatisticsDTO selBoardStatistics() {
		return mapper.selBoardStatistics();
	}
	public StatisticsDTO selReplyStatistics() {
		return mapper.selReplyStatistics();
	}
	public StatisticsDTO selTranHisStatistics() {
		return mapper.selTranHisStatistics();
	}
	public StatisticsDTO selSalesStatistics() {
		return mapper.selSalesStatistics();
	}
	
	public List<MemberDTO> selMember(Map<String, Object> param) {
		return mapper.selMember(param);
	}
	
	public List<BoardDTO> selBoard(Map<String, Object> param){
		
		return mapper.selBoard(param);
	
	}
	
	public List<BannerDTO> bannerList(BannerDTO dto){
		return mapper.bannerList(dto);
	}
	
	public List<ReportVO> selReport(ReportDTO dto){
		return mapper.selReport(dto);
	}
	
	public List<AskDTO> selAskList(AskDTO dto){
		return mapper.selAskList(dto);
	}
	
	public BannerDTO selinfo(BannerDTO dto) {
		BannerDTO vo = mapper.selinfo(dto);
		String path = "/img/banner/banner/"+dto.getChkImg();
		if(futils.delFile(path)) {
		}else {
		}
		
		if(vo.getba_img().equals(dto.getChkImg())) {
			dto.setba_img("");
			mapper.updBannerImg(dto);
		}
		
		return vo;
	}
	
	public List<BoardDTO> delBoardList(Map<String,Object> map) {
		return mapper.delBoardList(map);
	}
	
	public int delBoard(BoardDTO dto) {
		return mapper.delBoard(dto);
	}
	
	
	public int delMember(MemberDTO dto) {
		if(dto.getState() == 1) {
			return mapper.delMember(dto);
		}else if(dto.getState() ==2) {
		
			return mapper.liftBan(dto);
		}
		
		return 0;
	}
	
	public int insReport(ReportDTO dto){
		return mapper.insReport(dto);
	}
	
	public int delAsk(AskDTO dto) {
		return mapper.delAsk(dto);
	}
	public AskDTO selAsk(AskDTO dto) {
		return mapper.selAsk(dto);
	}
	
	public int bannerimgUpload(MultipartFile[] imgs) {
		BannerDTO dto = new BannerDTO();
		if(imgs.length>5 || imgs.length ==0) {
			return 0;
		}
		String folder= "/img/banner/banner";
		try {
			for(int i=0; i<imgs.length; i++) {
				MultipartFile file = imgs[i];
				String fileNm = futils.saveFile(file, folder);
				if(file == null) {
					return 0;
				}
				
					if(i==0) {
						dto.setBa_no(1);
						dto.setba_img(fileNm);
						mapper.updBannerImg(dto);
					}else if(i==1) {
						dto.setBa_no(2);
						dto.setba_img(fileNm);
						mapper.updBannerImg(dto);
					}else if(i==2) {
						dto.setBa_no(3);
						dto.setba_img(fileNm);
						mapper.updBannerImg(dto);
					}else if(i==3) {
						dto.setBa_no(4);
						dto.setba_img(fileNm);
						mapper.updBannerImg(dto);
					}else if(i==4) {
						dto.setBa_no(5);
						dto.setba_img(fileNm);
						mapper.updBannerImg(dto);
				}
			}
				
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		
		return 1;
	}
	
	
	
	public int delReport(ReportDTO dto) {
		return mapper.delReport(dto);
	}
	
	public int selCountMember(Map<String, Object> param) {
		return mapper.selCountMember(param);
	}
	
	public int selCountBoard(Map<String, Object> param) {
		return mapper.selCountBoard(param);
	}
	
	public int selCountDelBoard(Map<String, Object> param) {
		return mapper.selCountDelBoard(param);
	}
	
	public String[] autoComplete() {
		return mapper.selAllNickname();
	}
	
	public int sendAllMessage(AdminMessageDTO param) {
		egovframework.sth.domain.member.domain.MemberDTO member = new egovframework.sth.domain.member.domain.MemberDTO();
		member = (egovframework.sth.domain.member.domain.MemberDTO) session.getAttribute("loginMember");
		param.setMs_sender(member.getM_no());
		param.setMs_receiver(mapper.selAllMember());
		return mapper.sendAllMessage(param);
	}
	
	
	public int okBoard(BoardDTO dto) {
		if(dto.getState() == 1) {
			return mapper.okBoard(dto);
		}else if(dto.getState() == 2) {
			return mapper.nonOk(dto);
		}
		
		return 0;
  }
	public List<TransactionHistoryDTO> getHistory() {
		return mapper.selTransactionHistory();
	}
	
	public void excelDownload(HttpServletRequest request, HttpServletResponse response, String table, List<?> dto) throws Exception {
		excelDownload.reqExcelDownload(request, response, table, dto);
	}
}