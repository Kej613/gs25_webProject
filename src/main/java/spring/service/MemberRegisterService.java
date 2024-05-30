package spring.service;
import java.time.LocalDateTime;

import org.springframework.stereotype.Service;

import spring.dao.MemberDao;
import spring.entity.Member;
import spring.RegisterRequest;

@Service
public class MemberRegisterService {
private MemberDao memberDao;

public MemberRegisterService(MemberDao memberDao) {
		this.memberDao = memberDao;
}

//직원등록
public Long regist(RegisterRequest req) throws Exception {
		Member member = memberDao.selectByEmail(req.getEmail());
		if (member != null) {
		throw new Exception("DuplicateMemberException");
}
Member newMember = new Member( req.getEmail(), req.getPassword(),
		req.getName(), LocalDateTime.now());
		memberDao.insert(newMember);
		return newMember.getId();
}
}
