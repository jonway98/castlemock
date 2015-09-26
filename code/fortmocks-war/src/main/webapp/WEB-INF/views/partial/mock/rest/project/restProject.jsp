<%@ include file="../../../../includes.jspf"%>

<%--
  ~ Copyright 2015 Karl Dahlgren
  ~
  ~ Licensed under the Apache License, Version 2.0 (the "License");
  ~ you may not use this file except in compliance with the License.
  ~ You may obtain a copy of the License at
  ~
  ~   http://www.apache.org/licenses/LICENSE-2.0
  ~
  ~ Unless required by applicable law or agreed to in writing, software
  ~ distributed under the License is distributed on an "AS IS" BASIS,
  ~ WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  ~ See the License for the specific language governing permissions and
  ~ limitations under the License.
  --%>

<c:url var="rest_resource_update_url"  value="/web/rest/project/${restProject.id}" />
<div class="content-top">
    <h1><spring:message code="rest.restproject.header.project" arguments="${restProject.name}"/></h1>
    <div align="right">
        <sec:authorize access="hasRole('ADMIN') or hasRole('MODIFIER')">
        <a class="button-success pure-button" href="<c:url value="/web/rest/project/${restProject.id}/update"/>"><i class="fa fa-file"></i> <span><spring:message code="rest.restproject.button.update"/></span></a>
        <a class="button-secondary pure-button" href="<c:url value="/web/rest/project/${restProject.id}/add/wadl"/>"><i class="fa fa-plus"></i> <span><spring:message code="rest.restproject.button.upload" arguments="wadl"/></span></a>
        <a class="button-secondary pure-button" href="<c:url value="/web/rest/project/${restProject.id}/export"/>"><i class="fa fa-cloud-download"></i> <span><spring:message code="rest.restproject.button.export"/></span></a>
        <a class="button-error pure-button" href="<c:url value="/web/rest/project/${restProject.id}/delete"/>"><i class="fa fa-trash"></i> <span><spring:message code="rest.restproject.button.delete"/></span></a>
        </sec:authorize>
    </div>
</div>
<div class="content-summary">
    <table class="formTable">
        <tr>
            <td class="column1"><label path="name"><spring:message code="rest.restproject.label.name"/></label></td>
            <td class="column2"><label path="name">${restProject.name}</label></td>
        </tr>
        <tr>
            <td class="column1"><label path="description"><spring:message code="rest.restproject.label.description"/></label></td>
            <td class="column2"><label path="description">${restProject.description}</label></td>
        </tr>
        <tr>
            <td class="column1"><label path="projectType"><spring:message code="rest.restproject.label.type"/></label></td>
            <td class="column2"><label path="projectType">REST</label></td>
        </tr>
        <tr>
            <td class="column1"><label path="domainNameStrategy"><spring:message code="rest.restproject.label.domainnamestrategies"/></label></td>
            <td class="column2"><label path="domainNameStrategy">${restProject.domainNameStrategy.strategy}</label></td>
        </tr>
    </table>
</div>

<h2 class="decorated"><span><spring:message code="rest.restproject.header.ports"/></span></h2>
<c:choose>
    <c:when test="${restProject.restResources.size() > 0}">
        <form:form action="${rest_resource_update_url}/" method="POST"  commandName="restResourceModifierCommand">
            <div class="table-frame">
                <table class="entityTable">
                    <tr>
                        <th><spring:message code="rest.restproject.column.selected"/></th>
                        <th><spring:message code="rest.restproject.column.port"/></th>
                    </tr>
                    <c:forEach items="${restProject.restResources}" var="restResource" varStatus="loopStatus">
                        <tr class="${loopStatus.index % 2 == 0 ? 'even' : 'odd'}">
                            <td><form:checkbox path="restPortIds" name="${restResource.id}" value="${restResource.id}"/></td>
                            <td><a href="<c:url value="/web/rest/project/${restProject.id}/resource/${restResource.id}"/>">${restResource.name}</a></td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
            <sec:authorize access="hasRole('ADMIN') or hasRole('MODIFIER')">
                <button class="button-secondary pure-button" type="submit" name="action" value="update-endpoint"><i class="fa fa-code-fork"></i> <span><spring:message code="rest.restproject.button.updateendpoint"/></span></button>
                <button class="button-error pure-button" type="submit" name="action" value="delete"><i class="fa fa-trash"></i> <span><spring:message code="rest.restproject.button.deleteport"/></span></button>
            </sec:authorize>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form:form>

    </c:when>
    <c:otherwise>
        <spring:message code="rest.restproject.label.noports" arguments="wadl"/>
    </c:otherwise>
</c:choose>
