<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>

<jsp:include page="partials/header.jsp" />
<jsp:include page="partials/navbar.jsp" />

<section class="cart-section">
	<h1 class="cart-title">Your Cart</h1>
	<c:choose>
		<c:when test="${empty cartItems}">
			<div class="cart-empty">
				<svg width="64" height="64" viewBox="0 0 24 24" fill="none"
					stroke="#333" stroke-width="1.5">
					<circle cx="9" cy="20" r="1" />
					<circle cx="18" cy="20" r="1" />
					<path d="M3 4h2l2.6 12.6a2 2 0 002 1.4h8.8a2 2 0 002-1.6L21 8H6" />
				</svg>
				<p>Your cart is empty.</p>
				<a href="${pageContext.request.contextPath}/home"
					class="continue-btn">Browse Restaurants</a>
			</div>
		</c:when>
		<c:otherwise>
			<div class="cart-container">
				<div class="cart-items">
					<c:forEach var="item" items="${cartItems}">
						<div class="cart-card">
							<img
								src="${pageContext.request.contextPath}/assets/images/${item.imageUrl}"
								alt="${item.itemName}">
							<div class="cart-card-info">
								<h3>${item.itemName}</h3>
								<p class="cart-restaurant">${item.restaurantName}</p>
								<p class="cart-price">
									&#8377;
									<fmt:formatNumber value="${item.price}" pattern="#,##0.00" />
								</p>
							</div>
							<div class="cart-card-actions">
								<div class="qty-controls">
									<button type="button" class="qty-btn qty-minus"
										onclick="updateQty(${item.cartItemId}, ${item.quantity}, -1)">
										<svg width="14" height="14" viewBox="0 0 24 24" fill="none"
											stroke="currentColor" stroke-width="2.5">
											<line x1="5" y1="12" x2="19" y2="12" />
										</svg>
									</button>
									<span class="qty-display" id="qty-${item.cartItemId}">${item.quantity}</span>
									<button type="button" class="qty-btn qty-plus"
										onclick="updateQty(${item.cartItemId}, ${item.quantity}, 1)">
										<svg width="14" height="14" viewBox="0 0 24 24" fill="none"
											stroke="currentColor" stroke-width="2.5">
											<line x1="12" y1="5" x2="12" y2="19" />
											<line x1="5" y1="12" x2="19" y2="12" />
										</svg>
									</button>
								</div>
								<form id="remove-form-${item.cartItemId}"
									action="${pageContext.request.contextPath}/cart" method="post">
									<input type="hidden" name="cartItemId"
										value="${item.cartItemId}"> <input type="hidden"
										name="action" value="remove">
									<button type="submit" class="remove-btn">Remove</button>
								</form>
								<form id="update-form-${item.cartItemId}"
									action="${pageContext.request.contextPath}/cart" method="post"
									style="display: none">
									<input type="hidden" name="cartItemId"
										value="${item.cartItemId}"> <input type="hidden"
										name="action" value="update"> <input type="hidden"
										name="quantity" id="qty-input-${item.cartItemId}"
										value="${item.quantity}">
								</form>
							</div>
						</div>
					</c:forEach>
				</div>
				<div class="cart-summary">
					<h2>Order Summary</h2>
					<div class="summary-row">
						<span>Total Items</span> <span>${cartItems.size()}</span>
					</div>
					<div class="summary-divider"></div>
					<div class="summary-row total">
						<span>Total Amount</span> <span>&#8377;<fmt:formatNumber
								value="${total}" pattern="#,##0.00" /></span>
					</div>
					<a href="${pageContext.request.contextPath}/checkout"
						class="checkout-btn"> <svg width="16" height="16"
							viewBox="0 0 24 24" fill="none" stroke="currentColor"
							stroke-width="2">
							<path d="M5 12h14M13 5l7 7-7 7" />
						</svg> Proceed to Checkout
					</a> <a href="${pageContext.request.contextPath}/home"
						class="continue-btn">Continue Shopping</a>
				</div>
			</div>
		</c:otherwise>
	</c:choose>
</section>

<script>
function updateQty(cartItemId, currentQty, change) {
	var newQty = currentQty + change;
	if (newQty < 1) {
		document.getElementById('remove-form-' + cartItemId).submit();
		return;
	}
	if (newQty > 10) return;
	document.getElementById('qty-' + cartItemId).textContent = newQty;
	document.getElementById('qty-input-' + cartItemId).value = newQty;
	document.getElementById('update-form-' + cartItemId).submit();
}
</script>

<jsp:include page="partials/footer.jsp" />