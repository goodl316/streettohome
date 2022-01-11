package egovframework.sth.domain.board.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.sth.domain.board.domain.BoardDTO;

@Mapper
public interface BoardMapper {
	
	BoardDTO selBoardView(BoardDTO param);
	public List<BoardDTO> boardList(BoardDTO dto);
	int insBoard(BoardDTO dto);
	int updpatImg(BoardDTO dto);
}
