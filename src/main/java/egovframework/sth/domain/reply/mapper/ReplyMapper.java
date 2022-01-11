package egovframework.sth.domain.reply.mapper;


import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.sth.domain.reply.domain.ReplyDTO;

@Mapper
public interface ReplyMapper {
	
	int insReply(ReplyDTO param);
	int insReReply(ReplyDTO param);
	int updReReply(ReplyDTO param);
	List<ReplyDTO> selReply(int b_no);
	int delReply(int r_no);
	
}
