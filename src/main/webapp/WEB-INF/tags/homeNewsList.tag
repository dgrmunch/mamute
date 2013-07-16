<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<%@attribute name="newses" type="java.util.List" required="true"%>

<div class="subheader">
		<h2 class="title page-title">
			<fmt:message key="menu.news" />
		</h2>
	</div>
	<ol class="news-list">
		<c:forEach items="${newses}" var="news">
			<li class="post-item news-item">
				<div class="post-information news-information">
					<tags:postItemInformation key="post.list.vote" count="${news.voteCount}" information="votes" htmlClass="news-info"/> 
				</div>
				<div class="summary news-summary">
					<div class="item-title-wrapper">
						<h3 class="title item-title news-title">
							<a href="/${news.id}-${news.sluggedTitle}">${news.title}</a>
						</h3>
						<time class="when" ${microdata ? 'itemprop="dateCreated"' : ''} 
							datetime="${news.createdAt}">
							<fmt:message key='touch.created'/> 
							<tags:prettyTime time="${news.createdAt}"/>
						</time>
					</div>
					<tags:lastTouchFor showTime="false" touchable="${news}"/>
				</div>
			</li>
		</c:forEach>
	</ol>
	