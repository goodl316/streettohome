package egovframework.sth.domain.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.sth.domain.admin.domain.BannerDTO;
import egovframework.sth.domain.main.domain.MainVO;
import egovframework.sth.domain.main.mapper.MainMapper;

@Service
public class MainService {
	
	@Autowired
	private MainMapper mapper;
	
	public List<MainVO> selDogList(MainVO vo){
		return mapper.selDogList(vo);
	}
	public List<MainVO> selCatList(MainVO vo){
		return mapper.selCatList(vo);
	}
	
	public List<MainVO> bannerList(MainVO vo){
		return mapper.bannerList(vo);
	}
	

}
