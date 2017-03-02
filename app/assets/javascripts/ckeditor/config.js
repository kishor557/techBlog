/*
Copyright (c) 2003-2012, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/


CKEDITOR.editorConfig = function( config )
{

  config.startupShowBorders = true;
  config.resize_enabled = false;
  config.scayt_autoStartup = true;
  config.language = 'en';
  config.extraPlugins = 'widget,lineutils,codesnippet,colorbutton';

  config.toolbar_Default = [
    { name: 'basicstyles', items: [ 'Bold','Italic','Underline', '-', 'NumberedList','BulletedList', 'Link','Unlink', 'CodeSnippet','RemoveFormat', 'LineUtils' ] },
    '/'
  ];
  config.toolbar_Custom = [
    { name: 'document', items : [ 'Source','Preview' ] },
    { name: 'clipboard', items : [ 'Cut','Copy','Paste','PasteText','PasteFromWord' ] },
	  { name: 'editing', items : [ 'Find','Replace','SelectAll','RemoveFormat' ] },
	  { name: 'styles', items : [ 'Format','Font','FontSize' ] },
	  { name: 'colors', items: [ 'TextColor', 'BGColor' ] },
	  { name: 'basicstyles', items : [ 'Bold','Italic','Underline','Strike','Subscript','Superscript' ] },
	  { name: 'paragraph', items : [ 'NumberedList','BulletedList','-','Outdent','Indent','-','Blockquote','CreateDiv',
	  '-','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock','-','BidiLtr','BidiRtl' ] },
	  { name: 'links', items : [ 'Link','Unlink','Anchor' ] },
	  { name: 'insert', items : [ 'Image','Flash','Table','HorizontalRule','Smiley','SpecialChar','PageBreak','Iframe', 'CodeSnippet', 'LineUtils' ] }
  ];
  config.toolbar = 'Custom';
  return true;
};
