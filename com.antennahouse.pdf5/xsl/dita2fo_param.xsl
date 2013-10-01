<?xml version='1.0' encoding="UTF-8" ?>
<!--
****************************************************************
DITA to XSL-FO Stylesheet
Module: Stylesheet parameter and global variables.
Copyright © 2009-2009 Antenna House, Inc. All rights reserved.
Antenna House is a trademark of Antenna House, Inc.
URL    : http://www.antennahouse.com/
E-mail : info@antennahouse.com
****************************************************************
-->
<xsl:stylesheet version="2.0" 
 xmlns:fo="http://www.w3.org/1999/XSL/Format" 
 xmlns:xs="http://www.w3.org/2001/XMLSchema"
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 xmlns:ahf="http://www.antennahouse.com/names/XSLT/Functions/Document"
 exclude-result-prefixes="xs ahf"
>
    <!-- Primary style definition file. -->
    <xsl:param name="PRM_STYLE_DEF_FILE" select="'../config/default_style.xml'" />
    
    <!-- Second style definition file  : Absolute path or XSL stylesheet relative path -->
    <xsl:param name="PRM_ALT_STYLE_DEF_FILE" select="$doubleApos"/>
    
    <!-- 
        Assume indexterm/primary/@sortas, secondary/@sortas as pinyin 
        when language is zh-CN. 
      -->
    <xsl:param name="PRM_ASSUME_SORTAS_PINYIN" select="$cNo"/>
    <xsl:variable name="pAssumeSortasPinyin" select="boolean($PRM_ASSUME_SORTAS_PINYIN=$cYes)" as="xs:boolean"/>
    
    <!-- Make link for index-see or index-see-also
         (CAUTION: It sometimes make invalid FO.)
      -->
    <xsl:param name="PRM_MAKE_SEE_LINK" select="$cYes"/>
    <xsl:variable name="pMakeSeeLink" select="boolean($PRM_MAKE_SEE_LINK=$cYes)" as="xs:boolean"/>
    
    <!-- Include frontmatter to toc
      -->
    <xsl:param name="PRM_INCLUDE_FRONTMATTER_TO_TOC" select="$cNo"/>
    <xsl:variable name="pIncludeFrontmatterToToc" select="boolean($PRM_INCLUDE_FRONTMATTER_TO_TOC=$cYes)" as="xs:boolean"/>
    
    <!-- Add numbering prefix to part/chapter title
      -->
    <xsl:param name="PRM_ADD_NUMBERING_TITLE_PREFIX" select="$cYes"/>
    <xsl:variable name="pAddNumberingTitlePrefix" select="boolean($PRM_ADD_NUMBERING_TITLE_PREFIX=$cYes)" as="xs:boolean"/>
    
    <!-- Add part/chapter to title
     -->
    <xsl:param name="PRM_ADD_PART_TO_TITLE" select="$cYes"/>
    <xsl:variable name="pAddPartToTitle" select="boolean($PRM_ADD_PART_TO_TITLE=$cYes) and $pAddNumberingTitlePrefix" as="xs:boolean"/>
    
    <!-- Add thmbnail index
      -->
    <xsl:param name="PRM_ADD_THUMBNAIL_INDEX" select="$cYes"/>
    <xsl:variable name="pAddThumbnailIndex" select="boolean($PRM_ADD_THUMBNAIL_INDEX=$cYes)" as="xs:boolean"/>
    
    <!-- Document language -->
    <xsl:param name="PRM_LANG" select="$doubleApos" />
    
    <!-- Output draft-comment -->
    <xsl:param name="PRM_OUTPUT_DRAFT_COMMENT" select="$cNo"/>
    <xsl:variable name="pOutputDraftComment" select="boolean($PRM_OUTPUT_DRAFT_COMMENT=$cYes)" as="xs:boolean"/>
    
    <!-- Output required-cleanup -->
    <xsl:param name="PRM_OUTPUT_REQUIRED_CLEANUP" select="$cNo"/>
    <xsl:variable name="pOutputRequiredCleanup" select="boolean($PRM_OUTPUT_REQUIRED_CLEANUP=$cYes)" as="xs:boolean"/>
    
    <!-- Generate unique id in XSL-FO: Deprecated. -->
    <!--xsl:param name="PRM_GEN_UNIQUE_ID" select="$cYes"/>
    <xsl:variable name="pGenUniqueId" select="boolean($PRM_GEN_UNIQUE_ID eq $cYes)" as="xs:boolean"/-->
    
    <!-- Use @oid in XSL-FO 
         ADDED: 2010/12/16 t.makita
    -->
    <xsl:param name="PRM_USE_OID" select="$cYes"/>
    <xsl:variable name="pUseOid" select="boolean($PRM_USE_OID eq $cYes)" as="xs:boolean"/>
    
    
    <!-- Format dl as block -->
    <xsl:param name="PRM_FORMAT_DL_AS_BLOCK" select="$cYes"/>
    <xsl:variable name="pFormatDlAsBlock" select="boolean($PRM_FORMAT_DL_AS_BLOCK=$cYes)" as="xs:boolean"/>
    
    <!-- Honor toc="no" or not -->
    <xsl:param name="PRM_APPLY_TOC_ATTR" select="$cYes"/>
    <xsl:variable name="pApplyTocAttr" select="boolean($PRM_APPLY_TOC_ATTR=$cYes)" as="xs:boolean"/>
    
    <!-- Online or pre-press PDF -->
    <xsl:param name="PRM_ONLINE_PDF" select="$cYes"/>
    <xsl:variable name="pOnlinePdf" select="boolean($PRM_ONLINE_PDF=$cYes)" as="xs:boolean"/>
    
    <!-- Adopt topicref/@navtitle for topicref/[not(@href)] 
         2011-07-26 t.makita
     -->
    <xsl:param name="PRM_ADOPT_NAVTITLE" select="$cYes"/>
    <xsl:variable name="pAdoptNavtitle" select="boolean($PRM_ADOPT_NAVTITLE=$cYes)" as="xs:boolean"/>
    
    <!-- Use outputclass="deprecated" 
         2011-09-05 t.makita
     -->
    <xsl:param name="PRM_USE_OUTPUT_CLASS_DEPRECATED" select="$cNo"/>
    <xsl:variable name="pUseOutputClassDeprecated" select="boolean($PRM_USE_OUTPUT_CLASS_DEPRECATED=$cYes)" as="xs:boolean"/>
    
    <!-- Use outputclass="nohyphenation" 
         2011-09-05 t.makita
     -->
    <xsl:param name="PRM_USE_OUTPUT_CLASS_NOHYPHENATE" select="$cNo"/>
    <xsl:variable name="pUseOutputClassNoHyphenate" select="boolean($PRM_USE_OUTPUT_CLASS_NOHYPHENATE=$cYes)" as="xs:boolean"/>
    
    <!-- Sort glossentry according to the xml:lang of map
         2011-10-11 t.makita
     -->
    <xsl:param name="PRM_SORT_GLOSSENTRY" select="$cYes"/>
    <xsl:variable name="pSortGlossEntry" select="boolean($PRM_SORT_GLOSSENTRY=$cYes)" as="xs:boolean"/>
    
    <!-- Supress first page-break for first child of part,chapter,appendix in bookmap
         2012-04-02 t.makita
    -->
    <xsl:param name="PRM_SUPRESS_FIRST_CHILD_PAGE_BREAK" select="$cYes"/>
    <xsl:variable name="pSupressFirstChildPageBreak" select="boolean($PRM_SUPRESS_FIRST_CHILD_PAGE_BREAK=$cYes)" as="xs:boolean"/>
    
    <!-- Compatibility parameter.
         Display footnote at the end of topic.
         If this parameter is "no" then <fn> must exists as the descendant of table, simpletable, ul, ol, glossdef and
         the <fn> elements are displayed at the end of these elements.
         2012-04-04 t.makita
    -->
    <xsl:param name="PRM_DIPLAY_FN_AT_END_OF_TOPIC" select="$cNo"/>
    <xsl:variable name="pDisplayFnAtEndOfTopic" select="boolean($PRM_DIPLAY_FN_AT_END_OF_TOPIC=$cYes)" as="xs:boolean"/>
    
    <!-- Compatibility parameter.
         Display table/title at the end of the table.
         The new implemenatation outputs table/title before its body.
         2012-04-04 t.makita
    -->
    <xsl:param name="PRM_OUTPUT_TABLE_TITLE_AFTER" select="$cNo"/>
    <xsl:variable name="pOutputTableTitleAfter" select="boolean($PRM_OUTPUT_TABLE_TITLE_AFTER=$cYes)" as="xs:boolean"/>
      
    <!-- Output plug-in start message.
         2013-09-30 t.makita
      -->
    <xsl:param name="PRM_OUTPUT_START_MESSAGE" select="$cYes"/>
  <xsl:variable name="pOutputStartMessage" select="boolean($PRM_OUTPUT_START_MESSAGE=$cYes)" as="xs:boolean"/>
  
    
    <!-- Map directory
         2012-11-11 t.makita
     -->
    <xsl:param name="PRM_MAP_DIR_URL" as="xs:string" required="yes"/>
    <xsl:variable name="pMapDirUrl" as="xs:string" select="$PRM_MAP_DIR_URL"/>
    
</xsl:stylesheet>
