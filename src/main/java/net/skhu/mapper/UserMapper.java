package net.skhu.mapper;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.User;

@Mapper
public interface UserMapper {
	User findOne(int id);
	void insert(User user);
	void update(User user);
	void updatePassword(User user);
}
