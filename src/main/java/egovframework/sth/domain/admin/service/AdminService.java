package egovframework.sth.domain.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import egovframework.sth.domain.admin.domain.AskDTO;
import egovframework.sth.domain.admin.domain.BannerDTO;
import egovframework.sth.domain.admin.domain.BoardDTO;
import egovframework.sth.domain.admin.domain.MemberDTO;
import egovframework.sth.domain.admin.domain.ReportDTO;
import egovframework.sth.domain.admin.domain.ReportVO;
import egovframework.sth.domain.admin.mapper.AdminMapper;
import egovframework.sth.domain.board.domain.AnimalDTO;
import egovframework.sth.global.common.FileUtils;

@Service
public class AdminService {
	
	@Autowired
	private AdminMapper mapper;
	@Autowired
	private FileUtils futils;
	
	public List<MemberDTO> selMember(MemberDTO dto) {
		return mapper.selMember(dto);
	}
	
	public List<BoardDTO> selBoard(BoardDTO dto){
		return mapper.selBoard(dto);
	
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
			System.out.println("성공");
		}else {
			System.out.println("실패");
		}
		System.out.println(dto.getChkImg());
		System.out.println(vo.getBa_img1());
		System.out.println(vo.getBa_no());
		
		if(vo.getBa_img1().equals(dto.getChkImg())) {
			System.out.println("treu");
			dto.setBa_img1("");
			mapper.updBannerImg(dto);
		}
		
		return vo;
	}
	
	public List<BoardDTO> delBoardList(BoardDTO dto){
		return mapper.delBoardList(dto);
	}
	
	public int delBoard(BoardDTO dto) {
		return mapper.delBoard(dto);
	}
	
	
	public int delMember(MemberDTO dto) {
		return mapper.delMember(dto);
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
						dto.setBa_img1(fileNm);
						mapper.updBannerImg(dto);
					}else if(i==1) {
						dto.setBa_no(2);
						dto.setBa_img1(fileNm);
						mapper.updBannerImg(dto);
					}else if(i==2) {
						dto.setBa_no(3);
						dto.setBa_img1(fileNm);
						mapper.updBannerImg(dto);
					}else if(i==3) {
						dto.setBa_no(4);
						dto.setBa_img1(fileNm);
						mapper.updBannerImg(dto);
					}else if(i==4) {
						dto.setBa_no(5);
						dto.setBa_img1(fileNm);
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
}