package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.Comment;

@Mapper
public interface CommentMapper {
	List<Comment> findById(int studentId);
	void insert(Comment comment);
}
