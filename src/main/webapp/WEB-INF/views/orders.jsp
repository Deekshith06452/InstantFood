<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>

<jsp:include page="partials/header.jsp" />
<jsp:include page="partials/navbar.jsp" />

<section class="orders-section">
	<h1 class="orders-title">My Orders</h1>
	<c:choose>
		<c:when test="${empty orders}">
			<div class="orders-empty">
				<svg width="64" height="64" viewBox="0 0 24 24" fill="none"
					stroke="#333" stroke-width="1.5">
					<path d="M6 2h9l5 5v13a2 2 0 01-2 2H6a2 2 0 01-2-2V4a2 2 0 012-2z" />
					<line x1="8" y1="9" x2="16" y2="9" />
					<line x1="8" y1="13" x2="16" y2="13" />
					<line x1="8" y1="17" x2="13" y2="17" />
				</svg>
				<p>You have no orders yet.</p>
				<a href="${pageContext.request.contextPath}/home"
					class="shop-now-btn"> <svg width="16" height="16"
						viewBox="0 0 24 24" fill="none" stroke="currentColor"
						stroke-width="2">
						<path d="M5 12h14M13 5l7 7-7 7" />
					</svg> Order Now
				</a>
			</div>
		</c:when>
		<c:otherwise>
			<div class="orders-list">
				<c:forEach var="order" items="${orders}">
					<div class="order-card">
						<div class="order-card-header">
							<div>
								<h3>
									<svg width="16" height="16" viewBox="0 0 24 24" fill="none"
										stroke="#ff6a3d" stroke-width="2">
										<path
											d="M6 2h9l5 5v13a2 2 0 01-2 2H6a2 2 0 01-2-2V4a2 2 0 012-2z" />
										<line x1="8" y1="9" x2="16" y2="9" />
										<line x1="8" y1="13" x2="16" y2="13" />
										<line x1="8" y1="17" x2="13" y2="17" />
									</svg>
									Order #${order.orderId} — ${order.restaurantName}
								</h3>
								<p class="order-date">
									<svg width="12" height="12" viewBox="0 0 24 24" fill="none"
										stroke="currentColor" stroke-width="2">
										<circle cx="12" cy="12" r="9" />
										<polyline points="12 7 12 12 15 14" />
									</svg>
									<fmt:formatDate value="${order.orderDate}"
										pattern="dd MMM yyyy, hh:mm a" />
								</p>
							</div>
							<span class="order-status ${order.orderStatus}">${order.orderStatus}</span>
						</div>
						<div class="order-card-divider"></div>
						<div class="order-card-body">
							<p class="order-delivery">
								<svg width="14" height="14" viewBox="0 0 24 24" fill="none"
									stroke="#ff6a3d" stroke-width="2">
									<path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0118 0z" />
									<circle cx="12" cy="10" r="3" />
								</svg>
								${order.deliveryName}, ${order.deliveryAddress},
								${order.deliveryCity}
							</p>
							<p class="order-total">
								&#8377;
								<fmt:formatNumber value="${order.totalAmount}"
									pattern="#,##0.00" />
							</p>
						</div>
					</div>
				</c:forEach>
			</div>
		</c:otherwise>
	</c:choose>
</section>

<jsp:include page="partials/footer.jsp" />