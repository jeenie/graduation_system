package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.Comment;

@Mapper
public interface CommentMapper {
	Comment findById(int id);
	
	List<Comment> findByStudentId(int studentId);
	
	void insert(Comment comment);
	void delete(int id);
}
