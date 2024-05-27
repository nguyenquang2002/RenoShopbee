<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<nav>
    <div class="nav_content">
        <ul>
            <li>
                <a class="active" href="${base }/home">Home</a>
            </li>
            <c:forEach items="${categories}" var="category">
            	
            	<li>
            		<form action="${base }/list" method="get">
<%-- 	           			<input id="page1" name="page" class="form-control" value="${searchModel.page }" style="display: none;"> --%>
            			<select class="form-control" name="categoryId" id="categoryId" style="margin-right: 5px;display: none;">
							<option value="${category.id }"></option>
						</select>
            			<button type="submit" value="Search">${category.name }</button>
            		</form>
	            </li>
            </c:forEach>
            <li>
                <form id="form_search" action="${base }/list" method="get">
<%--                  	<input id="page2" name="page" class="form-control" value="${searchModel.page }" style="display: none;">
 --%>                    <input type="text" placeholder="Type your keyword" id="keyword" name="keyword" value="${searchModel.keyword }" />
                    <button type="submit" class="btn-search">
                        <i class="fa-solid fa-magnifying-glass"></i>
                    </button>
                </form>
            </li>
        </ul>
    </div>
</nav>