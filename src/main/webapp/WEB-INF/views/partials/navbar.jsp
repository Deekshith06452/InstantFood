<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>
<%@ page import="com.instantfood.dao.CartDAO"%>
<%@ page import="com.instantfood.daoimpl.CartDAOImpl"%>
<%@ page import="com.instantfood.model.User"%>
<%@ page import="java.util.List"%>

<%
int cartCount = 0;
User navUser = (User) session.getAttribute("loggedUser");
if (navUser != null) {
	CartDAO navCartDAO = new CartDAOImpl();
	List<?> navCartItems = navCartDAO.getCartItems(navUser.getUserId());
	cartCount = navCartItems.size();
}
%>

<nav class="navbar">
	<div class="logo">
		<a href="${pageContext.request.contextPath}/home" class="logo-link">
			<svg width="26" height="26" viewBox="0 0 24 24" fill="none">
                <path d="M4 13a8 8 0 0116 0H4z" fill="#ff6a3d" />
                <rect x="3" y="13" width="18" height="2.2" rx="1.1"
					fill="#ff6a3d" />
                <rect x="11" y="3" width="2" height="3.5" rx="1"
					fill="#ff6a3d" />
                <circle cx="12" cy="2.5" r="1.3" fill="#ff6a3d" />
            </svg> Instant<span class="accent">Food</span>
		</a>
	</div>
	<div class="search-box" id="searchBox">
		<svg width="16" height="16" viewBox="0 0 24 24" fill="none"
			stroke="currentColor" stroke-width="2" class="search-icon">
			<circle cx="11" cy="11" r="7" />
			<line x1="21" y1="21" x2="16.65" y2="16.65" /></svg>
		<input type="text" id="searchInput" autocomplete="off"
			placeholder="Search for restaurants, cuisines...">
		<div class="search-dropdown" id="searchDropdown"></div>
	</div>
	<div class="nav-links">
		<a href="${pageContext.request.contextPath}/home"
			class="${pageContext.request.servletPath == '/home' ? 'active' : ''}">
			<svg width="16" height="16" viewBox="0 0 24 24" fill="none"
				stroke="currentColor" stroke-width="2">
				<path d="M3 11l9-8 9 8" />
				<path d="M5 10v10h14V10" /></svg> Home
		</a> <a href="${pageContext.request.contextPath}/cart"
			class="${pageContext.request.servletPath == '/cart' ? 'active' : ''} nav-cart-link">
			<svg width="16" height="16" viewBox="0 0 24 24" fill="none"
				stroke="currentColor" stroke-width="2">
				<circle cx="9" cy="20" r="1" />
				<circle cx="18" cy="20" r="1" />
				<path d="M3 4h2l2.6 12.6a2 2 0 002 1.4h8.8a2 2 0 002-1.6L21 8H6" /></svg>
			Cart <c:if test="${cartCount > 0}">
				<span class="cart-badge">${cartCount}</span>
			</c:if>
		</a> <a href="${pageContext.request.contextPath}/orders"
			class="${pageContext.request.servletPath == '/orders' ? 'active' : ''}">
			<svg width="16" height="16" viewBox="0 0 24 24" fill="none"
				stroke="currentColor" stroke-width="2">
				<path d="M6 2h9l5 5v13a2 2 0 01-2 2H6a2 2 0 01-2-2V4a2 2 0 012-2z" />
				<line x1="8" y1="9" x2="16" y2="9" />
				<line x1="8" y1="13" x2="16" y2="13" />
				<line x1="8" y1="17" x2="13" y2="17" /></svg> Orders
		</a>

		<c:choose>
			<c:when test="${not empty sessionScope.userName}">
				<div class="profile-menu">
					<button type="button" class="profile-btn"
						onclick="toggleProfileMenu()">
						<span class="profile-avatar">${fn:toUpperCase(fn:substring(sessionScope.userName, 0, 1))}</span>
						<span class="profile-name">${sessionScope.userName}</span>
						<svg width="12" height="12" viewBox="0 0 24 24" fill="none"
							stroke="currentColor" stroke-width="2">
							<polyline points="6 9 12 15 18 9" /></svg>
					</button>
					<div class="profile-dropdown" id="profileDropdown">

						<!-- User Info Header -->
						<div class="profile-dropdown-header">
							<div class="profile-dropdown-avatar">
								${fn:toUpperCase(fn:substring(sessionScope.userName, 0, 1))}</div>
							<div class="profile-dropdown-info">
								<span class="profile-dropdown-name">${sessionScope.userName}</span>
								<span class="profile-dropdown-email">${sessionScope.userEmail}</span>
							</div>
						</div>

						<div class="profile-dropdown-divider"></div>

						<!-- Phone -->
						<div class="profile-dropdown-detail">
							<svg width="13" height="13" viewBox="0 0 24 24" fill="none"
								stroke="#888" stroke-width="2">
								<rect x="7" y="2" width="10" height="20" rx="2" />
								<line x1="11" y1="18" x2="13" y2="18" />
							</svg>
							<span>${sessionScope.userPhone}</span>
						</div>

						<!-- Address -->
						<div class="profile-dropdown-detail">
							<svg width="13" height="13" viewBox="0 0 24 24" fill="none"
								stroke="#888" stroke-width="2">
								<path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0118 0z" />
								<circle cx="12" cy="10" r="3" />
							</svg>
							<span>${sessionScope.userCity}</span>
						</div>

						<div class="profile-dropdown-divider"></div>


						<!-- Logout -->
						<a href="${pageContext.request.contextPath}/logout"
							class="logout-link"> <svg width="14" height="14"
								viewBox="0 0 24 24" fill="none" stroke="currentColor"
								stroke-width="2">
								<path d="M9 21H5a2 2 0 01-2-2V5a2 2 0 012-2h4" />
								<polyline points="16 17 21 12 16 7" />
								<line x1="21" y1="12" x2="9" y2="12" />
							</svg> Logout
						</a>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<a href="${pageContext.request.contextPath}/login"> <svg
						width="16" height="16" viewBox="0 0 24 24" fill="none"
						stroke="currentColor" stroke-width="2">
						<path d="M15 3h4a2 2 0 012 2v14a2 2 0 01-2 2h-4" />
						<polyline points="10 17 15 12 10 7" />
						<line x1="15" y1="12" x2="3" y2="12" />
					</svg> Login
				</a>
			</c:otherwise>
		</c:choose>
	</div>
</nav>

<script>
	function toggleProfileMenu() {
		document.getElementById('profileDropdown').classList.toggle('show');
	}
	document.addEventListener('click', function(e) {
		var menu = document.querySelector('.profile-menu');
		if (menu && !menu.contains(e.target)) {
			document.getElementById('profileDropdown').classList.remove('show');
		}
	});

	// ===== LIVE SEARCH =====
	(function () {
		var contextPath = '${pageContext.request.contextPath}';
		var input = document.getElementById('searchInput');
		var dropdown = document.getElementById('searchDropdown');
		var searchBox = document.getElementById('searchBox');
		var debounceTimer = null;

		input.addEventListener('input', function () {
			var query = input.value.trim();
			clearTimeout(debounceTimer);
			if (query.length === 0) {
				dropdown.classList.remove('show');
				dropdown.innerHTML = '';
				return;
			}
			debounceTimer = setTimeout(function () {
				fetch(contextPath + '/search?q=' + encodeURIComponent(query))
					.then(function (res) { return res.json(); })
					.then(function (data) { renderResults(data); })
					.catch(function () { dropdown.classList.remove('show'); });
			}, 250);
		});

		function renderResults(results) {
			if (!results || results.length === 0) {
				dropdown.innerHTML = '<div class="search-no-results">No restaurants found</div>';
				dropdown.classList.add('show');
				return;
			}
			var html = '';
			results.forEach(function (r) {
				html += '<a class="search-result-item" href="' + contextPath + '/restaurant?id=' + r.id + '">' +
					'<img src="' + contextPath + '/assets/images/' + r.image + '" alt="' + r.name + '">' +
					'<div class="search-result-info">' +
					'<span class="search-result-name">' + r.name + '</span>' +
					'<span class="search-result-cuisine">' + r.cuisine + '</span>' +
					'</div></a>';
			});
			dropdown.innerHTML = html;
			dropdown.classList.add('show');
		}

		document.addEventListener('click', function (e) {
			if (!searchBox.contains(e.target)) {
				dropdown.classList.remove('show');
			}
		});
	})();
</script>