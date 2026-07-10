<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<jsp:include page="partials/header.jsp" />
<jsp:include page="partials/navbar.jsp" />

<c:if test="${not empty sessionScope.cartSuccess}">
	<div class="toast-notification" id="cartToast">
		<svg width="16" height="16" viewBox="0 0 24 24" fill="none"
			stroke="currentColor" stroke-width="2">
			<circle cx="9" cy="20" r="1" />
			<circle cx="18" cy="20" r="1" />
			<path d="M3 4h2l2.6 12.6a2 2 0 002 1.4h8.8a2 2 0 002-1.6L21 8H6" /></svg>
		${sessionScope.cartSuccess}
	</div>
	<%
	session.removeAttribute("cartSuccess");
	%>
</c:if>
<section class="restaurant-header">
	<img
		src="${pageContext.request.contextPath}/assets/images/${restaurant.imageUrl}"
		alt="${restaurant.name}">
	<div class="restaurant-header-info">
		<h1>${restaurant.name}</h1>
		<p>${restaurant.description}</p>
		<p class="restaurant-full-address">
			<svg width="14" height="14" viewBox="0 0 24 24" fill="none"
				stroke="currentColor" stroke-width="2">
				<path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0118 0z" />
				<circle cx="12" cy="10" r="3" />
			</svg>
			${restaurant.address}, ${restaurant.city}
		</p>
		<div class="restaurant-meta">
			<span class="rating"><svg width="16" height="16"
					viewBox="0 0 24 24" fill="#ff6a3d">
					<polygon
						points="12 2 15 8.5 22 9.5 17 14.5 18.5 21.5 12 18 5.5 21.5 7 14.5 2 9.5 9 8.5 12 2" /></svg>
				${restaurant.rating}</span> <span class="meta-divider"></span> <span>${restaurant.cuisineType}</span>
			<span class="meta-divider"></span> <span><svg width="14"
					height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor"
					stroke-width="2">
					<circle cx="12" cy="12" r="9" />
					<polyline points="12 7 12 12 15 14" /></svg> ${restaurant.deliveryTime}
				mins</span>
		</div>
		<div class="restaurant-badge-row">
			<div class="restaurant-badge">
				<svg width="20" height="20" viewBox="0 0 24 24" fill="none"
					stroke="#ff6a3d" stroke-width="2">
					<path
						d="M3 13h11l3-6h4v6h-2M3 13v4a1 1 0 001 1h1m12-5v5a1 1 0 01-1 1h-1m-9 0a2 2 0 104 0m6 0a2 2 0 104 0" />
				</svg>
				<div>
					<strong>Free Delivery</strong> <span>On orders above
						&#8377;249</span>
				</div>
			</div>
			<div class="restaurant-badge">
				<svg width="20" height="20" viewBox="0 0 24 24" fill="#ff6a3d">
					<path
						d="M12 2l2.4 1.4 2.6-.6 1.4 2.4 2.6.6-.4 2.6 1.4 2.6-1.8 2 .4 2.6-2.6.8-1.4 2.2-2.6-.8L12 22l-2-1.8-2.6.8-1.4-2.2-2.6-.8.4-2.6L2 12.8 4 11l-.4-2.6 2.6-.6L7.6 5.4 10.2 4z" />
					<text x="12" y="14" font-size="7" fill="#141414"
						text-anchor="middle" font-weight="700">%</text>
				</svg>
				<div>
					<strong>20% OFF</strong> <span>Up to &#8377;100</span>
				</div>
			</div>
			<div class="restaurant-badge">
				<svg width="20" height="20" viewBox="0 0 24 24" fill="#ff6a3d">
					<polygon
						points="12 2 15 8.5 22 9.5 17 14.5 18.5 21.5 12 18 5.5 21.5 7 14.5 2 9.5 9 8.5 12 2" /></svg>
				<div>
					<strong>Top Rated</strong> <span>Among customers</span>
				</div>
			</div>
		</div>
	</div>
</section>
<section class="menu-section">
	<h2>Menu</h2>
	<div class="menu-grid">
		<c:forEach var="item" items="${menuItems}">
			<div class="menu-card">
				<div class="menu-img-wrap">
					<img
						src="${pageContext.request.contextPath}/assets/images/${item.imageUrl}"
						alt="${item.itemName}">
				</div>
				<div class="menu-card-body">
					<div class="menu-card-title">
						<h3>${item.itemName}</h3>
					</div>
					<p class="menu-description">${item.description}</p>
					<p class="menu-price">&#8377;${item.price}</p>
					<form action="${pageContext.request.contextPath}/addToCart"
						method="post">
						<input type="hidden" name="itemId" value="${item.itemId}">
						<input type="hidden" name="restaurantId"
							value="${restaurant.restaurantId}">
						<button type="submit" class="add-cart-btn">Add to Cart</button>
					</form>
				</div>
			</div>
		</c:forEach>
	</div>
</section>



<jsp:include page="partials/footer.jsp" />