package connect;

public class MemberDAO extends ConnOracle {
	public MemberDAO() {
		super();
	}
	
	public MemberDTO getDTO(String user_id, String user_pw) {
		MemberDTO dto = new MemberDTO();
		String query = "SELECT * FROM member WHERE id=? AND pass=?";
		
		try {
			psmt = conn.prepareStatement(query);
			psmt.setString(1, user_id);
			psmt.setString(2, user_pw);
			rSet = psmt.executeQuery();
			
			if(rSet.next()) {
				dto.setId(rSet.getString(1));
				dto.setPass(rSet.getString(2));
				dto.setName(rSet.getString(3));
				dto.setRegidate(rSet.getString(4));
			}
		}
		catch(Exception err) {
			System.out.println("쿼리문에 문제 생김");
			err.printStackTrace();
		}
		
		return dto;
	}
	
	public String findId(String name) {
		
		String findId = null;
		String query = "SELECT id FROM member WHERE name=?";
		
		try {
			psmt = conn.prepareStatement(query);
			psmt.setString(1, name);
			rSet = psmt.executeQuery();
			
			if(rSet.next()) {
				findId = rSet.getString(1);
			}
		}
		catch(Exception err) {
			System.out.println("아이디 찾기 중 예외발생");
			err.printStackTrace();
		}
		
		return findId;
	}
	
	public String findPw(String id, String name) {
		String findPw = null;
		String query = "SELECT pass FROM member WHERE id=? AND name=?";
		
		try {
			psmt = conn.prepareStatement(query);
			psmt.setString(1, id);
			psmt.setString(2, name);
			rSet = psmt.executeQuery();
			
			if(rSet.next()) {
				findPw = rSet.getString(1);
			}
		}
		catch(Exception err) {
			System.out.println("비밀번호 찾기 중 예외발생");
			err.printStackTrace();
		}
		
		return findPw;
	}
}
















