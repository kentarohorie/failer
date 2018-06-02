$(document).on('turbolinks:load', function() {
  $('#js-tagsinput').tagsInput({
    width: '100%',
    height: '45px',
    defaultText: ''
  });
  $('#summernote').summernote({
    height: 500,
    lang: 'ja-JP',
    removeMedia: true
  });
})
