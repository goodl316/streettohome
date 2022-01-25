package egovframework.sth.domain.board.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.sth.domain.board.domain.AnimalDTO;
import egovframework.sth.domain.board.domain.AuctionDTO;
import egovframework.sth.domain.board.domain.BoardDTO;
import egovframework.sth.domain.board.domain.BoardVO;
import egovframework.sth.domain.board.domain.BoardViewVO;

@Mapper
public interface BoardMapper {
	
	BoardViewVO selBoardView(BoardDTO param);
	public List<BoardVO> boardList(BoardVO vo);
	int insBoard(BoardDTO dto);
	int insAnimal(AnimalDTO dto);
	int updpatImg(AnimalDTO dto);
	BoardVO countBoard(BoardVO vo);
	AnimalDTO selinfo(AnimalDTO dto);
	BoardVO modselboard(BoardVO vo);
	int updateBoard(BoardVO vo);
	int updateAnimal(BoardVO vo);
	int insAuction(AuctionDTO dto);
}
	