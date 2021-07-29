package com.gem.bbs.shiro;

import com.gem.bbs.entity.ActiveUser;
import com.gem.bbs.entity.Permission;
import com.gem.bbs.entity.Question;
import com.gem.bbs.entity.User;
import com.gem.bbs.service.QuestionService;
import com.gem.bbs.service.UserService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

/**
 * 自定义reaml完成用户的认证和授权
 */
public class UserRealm extends AuthorizingRealm {

	@Autowired
	private UserService userService;
	@Autowired
	private QuestionService questionService;

	@Override
	public String getName() {
		return "userRealm";
	}

	// 支持什么类型的token
	@Override
	public boolean supports(AuthenticationToken token) {
		return token instanceof UsernamePasswordToken;
	}

	// 认证
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken token) throws AuthenticationException {

		// 从token中 获取用户身份信息
		String loginName = (String) token.getPrincipal();

		User sysUser = userService.findUserByLoginName(loginName);
		// 拿username从数据库中查询
		// ....
		// 如果查询不到则返回null
		if (sysUser == null) {// 这里模拟查询不到
			return null;
		}

		// 获取从数据库查询出来的用户密码
		String password = sysUser.getPassword();

		//获取盐
		String salt = sysUser.getSalt();
		
		// 构建用户身份信息
		ActiveUser activeUser = new ActiveUser();
		activeUser.setId(sysUser.getId());
		activeUser.setLoginname(sysUser.getLoginname());
		activeUser.setUsername(sysUser.getUsername());

		// 返回认证信息由父类AuthenticatingRealm进行认证
		SimpleAuthenticationInfo simpleAuthenticationInfo = new SimpleAuthenticationInfo(
				activeUser, password, ByteSource.Util.bytes(salt), getName());

		return simpleAuthenticationInfo;
	}

	// 授权
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(
			PrincipalCollection principals) {

		List<String> permissions = new ArrayList<>();
		// 将权限信息封闭为AuthorizationInfo
		SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo();
		simpleAuthorizationInfo.addStringPermissions(permissions);
		permissions.forEach(System.out::println);
		return simpleAuthorizationInfo;
	}

}
