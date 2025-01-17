<!DOCTYPE html>

<#include init />

<html class="${root_css_class}" dir="<@liferay.language key="lang.dir" />" lang="${w3c_language_id}">

<head>
	<title>${the_title} - ${company_name}</title>

	<meta content="initial-scale=1.0, width=device-width" name="viewport" />

	<@liferay_util["include"] page=top_head_include />
</head>

<body class="${css_class}">

<#--  <@liferay_ui["quick-access"] contentId="#main-content" />  -->

<#--  <@liferay_util["include"] page=body_top_include />  -->

<@liferay.control_menu />

<#if !is_signed_in>
    <div class="container-fluid" id="">
<#else>
    <div class="container-fluid" id="wrapper">
</#if>

	<div class="row">
        <header id="banner" class="header-menu col-xs-12" role="banner">
            <div class="container">
                <div class="main-heading">

                    <div id="heading" class="main-heading">
                        <div aria-level="1" class="site-title" role="heading">
                            <a class="${logo_css_class}" href="${site_default_url}" title="<@liferay.language_format arguments="${site_name}" key="go-to-x" />">
                                <img class="main-logo" alt="${logo_description}" height="${site_logo_height}" src="${site_logo}" width="${site_logo_width}" />
                            <#if show_site_name>
                                <span class="site-name" title="<@liferay.language_format arguments="${site_name}" key="go-to-x" />">
                                    ${site_name}
                                </span>
                            </#if>
                            </a>

                        </div>
                    </div>

                    <#--  <#if !is_signed_in>
                        <a data-redirect="${is_login_redirect_required?string}" href="${sign_in_url}" id="sign-in" rel="nofollow">${sign_in_text}</a>
                    </#if>  -->

                    <#if has_navigation && is_setup_complete>
                        <#include "${full_templates_path}/navigation.ftl" />
                    </#if>

                </div>
            </div>
        </header>
    </div>

	<section id="content">
		<#--  <h2 class="hide-accessible" role="heading" aria-level="1">${the_title}</h2>  -->

		<#if selectable>
			<@liferay_util["include"] page=content_include />
		<#else>
			${portletDisplay.recycle()}

			${portletDisplay.setTitle(the_title)}

			<@liferay_theme["wrap-portlet"] page="portlet.ftl">
				<@liferay_util["include"] page=content_include />
			</@>
		</#if>
	</section>
</div>

<@liferay_util["include"] page=body_bottom_include />

<@liferay_util["include"] page=bottom_include />

<!-- inject:js -->
<!-- endinject -->

</body>

</html>