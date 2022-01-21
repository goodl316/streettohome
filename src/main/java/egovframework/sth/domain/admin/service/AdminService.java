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
	
	public int delBoard(BoardDTO dto) {
		return mapper.delBoard(dto);
	}
	
	
	public int delMember(MemberDTO dto) {
		return mapper.delMember(dto);
	}
	
	public int insReport(ReportDTO dto){
		return mapper.insReport(dto);
	}
	public List<ReportVO> selReport(ReportDTO dto){
		return mapper.selReport(dto);
	}
	
	public List<AskDTO> selAskList(AskDTO dto){
		return mapper.selAskList(dto);
	}
	public int delAsk(AskDTO dto) {
		return mapper.delAsk(dto);
	}
	public AskDTO selAsk(AskDTO dto) {
		return mapper.selAsk(dto);
	}
	
	public int bannerimgUpload(MultipartFile[] imgs, int an_no) {
		if(imgs.length>5 || imgs.length ==0) {
			return 0;
		}
		String folder= "/img/admin/banner"+an_no;
		try {
			for(int i=0; i<imgs.length; i++) {
				MultipartFile file = imgs[i];
				String fileNm = futils.saveFile(file, folder);
				if(file == null) {
					return 0;
				}
				if(i==0) {
					BannerDTO dto = new BannerDTO();
					mapper.updbannerImg(dto);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		
		return 1;
	}
}