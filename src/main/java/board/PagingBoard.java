package board;

public class PagingBoard {
	
	public static String pagingStr(int countAll, int pageSize, int blockPage, 
									int pageNum, String url) {
		String pagingStr = "";
		
		//전체 페이지수
		int countPages = (int)(Math.ceil((double)countAll/pageSize));	
		//페이지 블럭의 첫번째 페이지번호
		int pageTemp = (((pageNum-1)/blockPage)*blockPage)+1;
		
		if(pageTemp !=1) {
			pagingStr += "<li class=\"page-item\"><a class=\"page-link\" href=\""+ url 
						+"?pageNum=1\"><i class='bi bi-skip-backward-fill'></i></a></li>";
			pagingStr += "<li class=\"page-item\"><a class=\"page-link\" href=\""+ url 
						+"?pageNum="+ (pageTemp-1) 
						+"\"><i class='bi bi-skip-start-fill'></i></a></li>";
		}
		
		int countBlock = 1;
		
		while(countBlock <= blockPage && pageTemp <= countPages) {
			if(pageTemp == pageNum) {
				pagingStr += "<li class=\"page-item active\"><a class=\"page-link\">"
							+ pageNum +"</a></li>";
			}
			else {
				pagingStr += "<li class=\"page-item\"><a class=\"page-link\" href=\""
							+ url +"?pageNum="+ pageTemp +"\">"+ pageTemp +"</a></li>";
			}
			pageTemp++;
			countBlock++;
		}
		
		if(pageTemp <= countPages) {
			pagingStr += "<li class=\"page-item\"><a class=\"page-link\" href=\""
						+ url +"?pageNum="+ pageTemp 
						+"\"><i class='bi bi-skip-end-fill'></i></a></li>";
			pagingStr += "<li class=\"page-item\"><a class=\"page-link\" href=\""
						+ url +"?pageNum="+ countPages 
						+"\"><i class='bi bi-skip-forward-fill'></i></a></li>";
		}
		return pagingStr;
	}	
}








