<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>

<jsp:include page="partials/header.jsp" />
<jsp:include page="partials/navbar.jsp" />

<section class="thankyou-section">

    <div class="thankyou-header">
        <div class="thankyou-icon">
            <svg width="50" height="50" viewBox="0 0 24 24"
                fill="none" stroke="#ff6a3d" stroke-width="2">
                <path d="M22 11.08V12a10 10 0 11-5.93-9.14"/>
                <polyline points="22 4 12 14.01 9 11.01"/>
            </svg>
        </div>
        <h1>Order Placed Successfully!</h1>
        <p>Thank you for ordering with
            <span class="accent">InstantFood</span></p>
        <span class="order-id-badge">
            Order #${order.orderId}
        </span>
    </div>

    <div class="thankyou-container">

        <div class="thankyou-left">

            <div class="thankyou-card">
                <h2>
                    <svg width="18" height="18" viewBox="0 0 24 24"
                        fill="none" stroke="#ff6a3d" stroke-width="2">
                        <path d="M3 2h9l5 5v13a2 2 0 01-2 2H3a2 2 0 01-2-2V4a2 2 0 012-2z"/>
                        <line x1="5" y1="9" x2="13" y2="9"/>
                        <line x1="5" y1="13" x2="13" y2="13"/>
                    </svg>
                    Order Details
                </h2>

                <div class="restaurant-info-row">
                    <svg width="16" height="16" viewBox="0 0 24 24"
                        fill="none" stroke="#ff6a3d" stroke-width="2">
                        <path d="M3 12h13a4 4 0 00-4-4H7a4 4 0 00-4 4z"/>
                        <line x1="2" y1="16" x2="20" y2="16"/>
                    </svg>
                    <span>${order.restaurantName}</span>
                </div>

                <div class="order-items-list">
                    <c:forEach var="item" items="${orderItems}">
                        <div class="order-item-row">
                            <div class="order-item-img-wrap">
                                <img src="${pageContext.request.contextPath}/assets/images/${item.imageUrl}"
                                    alt="${item.itemName}">
                            </div>
                            <div class="order-item-info">
                                <p class="order-item-name">${item.itemName}</p>
                                <p class="order-item-qty">Qty: ${item.quantity}</p>
                            </div>
                            <p class="order-item-price">
                                &#8377;<fmt:formatNumber
                                    value="${item.price}"
                                    pattern="#,##0.00"/>
                            </p>
                        </div>
                    </c:forEach>
                </div>

                <div class="order-total-row">
                    <span>Total Amount</span>
                    <span class="accent">
                        &#8377;<fmt:formatNumber
                            value="${order.totalAmount}"
                            pattern="#,##0.00"/>
                    </span>
                </div>
            </div>

            <div class="thankyou-card">
                <h2>
                    <svg width="18" height="18" viewBox="0 0 24 24"
                        fill="none" stroke="#ff6a3d" stroke-width="2">
                        <path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0118 0z"/>
                        <circle cx="12" cy="10" r="3"/>
                    </svg>
                    Delivery Details
                </h2>
                <div class="delivery-detail-row">
                    <span class="detail-label">Name</span>
                    <span>${order.deliveryName}</span>
                </div>
                <div class="delivery-detail-row">
                    <span class="detail-label">Phone</span>
                    <span>${order.deliveryPhone}</span>
                </div>
                <div class="delivery-detail-row">
                    <span class="detail-label">Address</span>
                    <span>${order.deliveryAddress}</span>
                </div>
                <div class="delivery-detail-row">
                    <span class="detail-label">City</span>
                    <span>${order.deliveryCity}</span>
                </div>
            </div>

        </div>

        <div class="thankyou-right">
            <div class="thankyou-card status-card">
                <div class="status-icon">
                    <svg width="30" height="30" viewBox="0 0 24 24"
                        fill="none" stroke="#ff6a3d" stroke-width="2">
                        <circle cx="5" cy="18" r="2"/>
                        <circle cx="19" cy="18" r="2"/>
                        <path d="M5 18h2l3-7h4l2 4h3"/>
                    </svg>
                </div>
                <h3>Order Status</h3>
                <span class="status-badge PLACED">
                    ${order.orderStatus}
                </span>
                <p class="status-message">
                    Your order has been placed successfully
                    and is being prepared!
                </p>
                <p class="order-time">
                    <fmt:formatDate value="${order.orderDate}"
                        pattern="dd MMM yyyy, hh:mm a"/>
                </p>
            </div>

            <div class="thankyou-actions">
                <a href="${pageContext.request.contextPath}/orders"
                    class="btn-primary">
                    <svg width="16" height="16" viewBox="0 0 24 24"
                        fill="none" stroke="currentColor" stroke-width="2">
                        <path d="M6 2h9l5 5v13a2 2 0 01-2 2H6a2 2 0 01-2-2V4a2 2 0 012-2z"/>
                        <line x1="8" y1="9" x2="16" y2="9"/>
                    </svg>
                    View All Orders
                </a>
                <a href="${pageContext.request.contextPath}/home"
                    class="btn-secondary">
                    <svg width="16" height="16" viewBox="0 0 24 24"
                        fill="none" stroke="currentColor" stroke-width="2">
                        <path d="M3 11l9-8 9 8"/>
                        <path d="M5 10v10h14V10"/>
                    </svg>
                    Order More Food
                </a>
            </div>
        </div>

    </div>

</section>

<jsp:include page="partials/footer.jsp" />