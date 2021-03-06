package egovframework.sth.domain.admin.mapper;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.sth.domain.admin.domain.AdminMessageDTO;
import egovframework.sth.domain.admin.domain.AskDTO;
import egovframework.sth.domain.admin.domain.BannerDTO;
import egovframework.sth.domain.admin.domain.BoardDTO;
import egovframework.sth.domain.admin.domain.MemberDTO;
import egovframework.sth.domain.admin.domain.ReportDTO;
import egovframework.sth.domain.admin.domain.ReportVO;
import egovframework.sth.domain.admin.domain.StatisticsDTO;
import egovframework.sth.domain.admin.domain.TableInfoDTO;
import egovframework.sth.global.common.excel.model.TransactionHistoryDTO;

@Mapper
public interface AdminMapper {

	List<MemberDTO> selMember(Map<String, Object> param);
	List<BoardDTO> selBoard(Map<String, Object> param);
	List<BoardDTO> delBoardList(Map<String,Object> param);
	List<ReportVO> selReport(ReportDTO dto);
	List<AskDTO> selAskList(AskDTO dto);
	List<BannerDTO> bannerList(BannerDTO dto);
	int[] selAllMember();
	String[] selAllNickname();
	List<TransactionHistoryDTO> selTransactionHistory();
	List<TableInfoDTO> selTableInfo(String table);
	StatisticsDTO selBoardStatistics();
	StatisticsDTO selReplyStatistics();
	StatisticsDTO selTranHisStatistics();
	StatisticsDTO selSalesStatistics();

	BannerDTO selinfo(BannerDTO dto);
	AskDTO selAsk(AskDTO dto);
	int delBoard(BoardDTO dto);
	int delMember(MemberDTO dto);
	int insReport(ReportDTO dto);
	int delAsk(AskDTO dto);
	int updBannerImg(BannerDTO dto);
	int insBannerImg(BannerDTO dto);
	int delReport(ReportDTO dto);
	int selCountMember(Map<String, Object> param);
	int selCountBoard(Map<String, Object> param);
	int selCountDelBoard(Map<String, Object> param);
	int sendAllMessage(AdminMessageDTO param);
	int liftBan(MemberDTO dto);
	int okBoard(BoardDTO dto);
	int nonOk(BoardDTO dto);
}
