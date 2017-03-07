<%@include file="/apps/centre/global.jsp"%>
<centre:model className="com.westfieldlabs.centre.components.pages.Footer" id="footer" cacheId="footerCache" />

<%-- TODO: Update everything to HTTPS once it's supported by all our websites --%>
<footer class="footer u-hide-for-print" data-track-location="center-footer">

  <%-- l-container --%>
  <div class="l-container l-container--full-bleed-up-to-medium">

    <%-- l-grid --%>
    <div class="l-grid l-grid--gutterless l-grid--reversed l-grid--equal-heights">

      <%-- l-grid__item --%>
      <div class="l-grid__item u-one-third-from-medium l-grid--equal-heights u-align-v-block-middle-flexbox">

        <%-- Social --%>
        <section class="footer__social">

          <c:if test="${not empty centreTwitter or not empty centreFacebook or not empty centrePintest or not empty centreInstagram or not empty centreYoutube}">

            <h4 class="u-hide-up-to-medium">Get To Know Us</h4>

            <h4 class="u-hide-from-medium">Get To Know Us</h4>

            <div class="u-s-mt-small u-s-mt-base-from-medium" data-test="footer-social-icon-links">
              <!-- TODO: Also check if empty for all social icon if tags -->
              <c:if test="${centreTwitter ne 'null' and not empty centreTwitter}">
                <a href="${centreTwitter}" class="footer__social__item" target="_blank" data-track="click out to twitter" data-track-label="">
                  <svg class="icon icon--size-xx-large" aria-label="Twitter">
                    <use xlink:href="#icon-circle-twitter"/>
                  </svg>
                </a>
              </c:if>

              <c:if test="${centreFacebook ne 'null' and not empty centreFacebook}">
                <a href="${centreFacebook}" class="footer__social__item" target="_blank" data-track="click out to facebook" data-track-label="">
                  <svg class="icon icon--size-xx-large" aria-label="Facebook">
                    <use xlink:href="#icon-circle-facebook"/>
                  </svg>
                </a>
              </c:if>

              <c:if test="${centrePintest ne 'null' and not empty centrePintest}">
                <a href="${centrePintest}" class="footer__social__item" target="_blank" data-track="click out to pinterest" data-track-label="">
                  <svg class="icon icon--size-xx-large" aria-label="Pinterest">
                    <use xlink:href="#icon-circle-pinterest"/>
                  </svg>
                </a>
              </c:if>

              <c:if test="${centreInstagram ne 'null' and not empty centreInstagram}">
                <a href="${centreInstagram}" class="footer__social__item" target="_blank" data-track="click out to instagram" data-track-label="">
                  <svg class="icon icon--size-xx-large" aria-label="Instagram">
                    <use xlink:href="#icon-circle-instagram"/>
                  </svg>
                </a>
              </c:if>

              <c:if test="${centreYoutube ne 'null' and not empty centreYoutube}">
                <a href="${centreYoutube}" class="footer__social__item" target="_blank" data-track="click out to youtube" data-track-label="">
                  <svg class="icon icon--size-xx-large" aria-label="Youtube">
                    <use xlink:href="#icon-circle-youtube"/>
                  </svg>
                </a>
              </c:if>
            </div>
          </c:if>

        </section>
        <%-- // Social --%>

      </div>
      <%-- // l-grid__item--%>

      <%-- l-grid__item --%>
      <div class="l-grid__item u-one-whole u-two-thirds-from-medium l-grid--equal-heights">

        <%-- Change Centre --%>
        <c:choose>
          <c:when test="${countryId eq 'us'}">
            <c:set var="changeCenterUrl" value="https://www.westfield.com" />
          </c:when>
          <c:when test="${countryId eq 'uk'}">
            <c:set var="changeCenterUrl" value="https://uk.westfield.com" />
          </c:when>
          <c:when test="${countryId eq 'au'}">
            <c:set var="changeCenterUrl" value="http://www.westfield.com.au" />
          </c:when>
          <c:when test="${countryId eq 'nz'}">
            <c:set var="changeCenterUrl" value="https://www.westfield.co.nz" />
          </c:when>
        </c:choose>

        <%-- Country Company --%>
        <c:choose>
          <c:when test="${countryId eq 'us' or countryId eq 'uk'}">
            <c:set var="changeCountryCompanyUrl" value="http://www.westfieldcorp.com" />
            <c:set var="countryCompany" value="Westfield Corp" />
          </c:when>
          <c:when test="${countryId eq 'au' or countryId eq 'nz'}">
            <c:set var="changeCountryCompanyUrl" value="http://www.scentregroup.com" />
            <c:set var="countryCompany" value="Scentre Group" />
          </c:when>
        </c:choose>

        <%-- Privacy Policy --%>
        <c:set var="changePrivacyPolicyUrl" value="${nationalRootPath}/privacy-policy.html" />
        <%-- Cookies Policy --%>
        <c:set var="changeCookiesPolicyUrl" value="${nationalRootPath}/cookies-policy.html" />
        <%-- Terms + Conditions --%>
        <c:set var="changeTermsConditionsUrl" value="${nationalRootPath}/terms-and-conditions.html" />

        <%-- Footer Nav and Center Info --%>
        <div class="footer__info footer__info--centre">

          <%-- Footer nav list --%>
          <ul class="footer__nav-list">

            <li class="footer__nav-list__item">

              <%-- Dropdown --%>
              <div class="dropdown dropdown--no-border dropdown--reverse">

                <button class="dropdown__select" href="#" data-toggle-visibility="country-list" data-options="align:top" data-track="click change country" data-track-label="">

                  <%-- Menu --%>
                  <div class="dropdown__menu" id="country-list" data-test="footer-country-dropdown">
                    <ul class="selecting-list" data-test="footer-country-dropdown-items">
                      <li><a href="//www.westfield.com.au/" data-track="click chosen country" data-track-label="">Australia</a></li>
                      <li><a href="//www.westfield.com/" data-track="click chosen country" data-track-label="">USA</a></li>
                      <li><a href="//www.westfield.co.nz/nz" data-track="click chosen country" data-track-label="">New Zealand</a></li>
                      <li><a href="//uk.westfield.com/uk" data-track="click chosen country" data-track-label="">United Kingdom</a></li>
                    </ul>
                  </div>
                  <%-- // Menu --%>

                  <div class="dropdown__label">
                    <div class="u-s-mr-large">
                      Choose Country
                    </div>
                  </div>

                  <div class="dropdown__icon">
                    <svg class="icon icon--color-white" viewBox="0 0 36 22" version="1.1" xmlns="http://www.w3.org/2000/svg">
                      <g stroke="none"><path d="M0,0 L36,0 L18,22 L0,0 Z"></path></g>
                    </svg>
                  </div>

                </button>

              </div>
              <%-- // Dropdown --%>
            </li><!--
            --><li class="footer__nav-list__item">

              <a href="${changeCenterUrl}" data-track="click change center" data-track-label="">
                Change <wf:I18n key="global/centre"/>
              </a>
            </li><!--
            --><c:forEach items="${footer.footerLinks}" var="footerLink"><!--
                --><li class="footer__nav-list__item">
                    <a href="${centre:getValidUrl(footerLink.link)}" target="${footerLink.newWindow eq 'true' ?'_blank':'_self'}" data-track="clicked ${fn:escapeXml(footerLink.title)}" data-track-label="" data-test="centre-footer__link">
                        ${footerLink.title}
                    </a>
                </li><!--
            --></c:forEach>

          </ul>
          <%-- // Footer Nav List --%>

          <%-- Footer Center Info --%>
          <div class="footer__centre u-text-size-small u-s-pe-base">

            <span class="footer__centre__item u-s-mr-large">
              <a href="${urlconfigs['map']}.html" data-track="click center map" data-track-label="" data-test="footer--centre-address">
                <svg class="icon icon--size-small" aria-hidden="true">
                  <use xlink:href="#icon-map"></use>
                </svg>

                ${centreAddress}
              </a>
            </span>

            <span class="footer__centre__item u-s-mr-large">
              <a href="tel:${centrePhoneNumber}" class="footer__phone" data-track="click call" data-track-label="" data-test="footer--centre-phone-number">
                <svg class="icon icon--size-small" aria-hidden="true">
                  <use xlink:href="#icon-phone"></use>
                </svg>

                ${centrePhoneNumber}
              </a>
            </span>

            <span class="footer__centre__item">
              <a href="${urlconfigs['hours']}.html" data-track="click center hours" data-track-label="" data-test="footer--centre-hours">
                <svg class="icon icon--size-small" aria-hidden="true">
                  <use xlink:href="#icon-hours"></use>
                </svg>
                <c:choose>
                  <c:when test="${not empty footer.centreHours}">
                    ${footer.centreHours}
                  </c:when>
                  <c:otherwise>
                    CLOSED
                  </c:otherwise>
                </c:choose>

              </a>
            </span>

          </div>
          <%-- // Footer Center Info --%>

          <%-- Footer secondary nav list --%>
          <ul class="footer__nav-list-secondary"><!--

            --><li>
              <a href="${changeCountryCompanyUrl}" target="_blank" data-track="click to company" data-track-label="">
                ${countryCompany}
              </a>
            </li><!--

            --><li>
              <a href="${changePrivacyPolicyUrl}" data-track="click privacy policy" data-track-label="" data-test="centre-footer__privacy-policy">
                Privacy Policy
              </a>
            </li><!--

          --><c:if test="${countryId eq 'uk'}">
              <li>
                <%-- the script tag for this span tag is in the js.jsp --%>
                <span id='teconsent'>
                </span>
              </li>
            </c:if><!--

            --><li>
              <a href="${changeTermsConditionsUrl}" data-track="click terms conditions" data-track-label="">
                Terms + Conditions
              </a>
            </li><!--

            --><li>
            <jsp:useBean id="date" class="java.util.Date" />
            <fmt:setLocale value="${pageLocale}"/>
            <fmt:formatDate value="${date}" pattern="yyyy" var="currentYear" />
              &copy; ${currentYear} ${countryCompany}
            </li><!--

            --><li class="westfield-labs-logo">
              <%-- Westfield logo --%>
              Experience By
              <a href="http://westfieldlabs.com" target="_blank" data-track="click out to westfield labs" data-track-label="">
                <svg class="icon footer__labs-logo">
                  <use xlink:href="#icon-labs-logo"/>
                </svg>
              </a>
              <%-- // Westfield logo --%>
            </li><!--
          --></ul>
          <%-- // Footer secondary nav list --%>

        </div>
        <%-- // Footer Nav and Center Info --%>

      </div>
      <%-- // l-grid__item --%>

    </div>
    <%-- // l-grid --%>

  </div>
  <%-- // l-container --%>

</footer>
