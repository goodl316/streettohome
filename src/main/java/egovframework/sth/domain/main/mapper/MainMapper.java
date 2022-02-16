package egovframework.sth.domain.main.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.sth.domain.admin.domain.BannerDTO;
import egovframework.sth.domain.main.domain.MainVO;

@Mapper
public interface MainMapper {

	List<MainVO> selDogList(MainVO vo);
	List<MainVO> selCatList(MainVO vo);
	List<MainVO> bannerList(MainVO vo);
	
}
