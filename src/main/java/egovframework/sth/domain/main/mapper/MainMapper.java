package egovframework.sth.domain.main.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.sth.domain.admin.domain.BannerDTO;
import egovframework.sth.domain.main.domain.MainVO;

@Mapper
public interface MainMapper {

	List<MainVO> selMainList(MainVO vo);
	List<MainVO> bannerList(MainVO vo);
	
}
