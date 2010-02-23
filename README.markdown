# Developer Challenge

Design and implement a system that will accept a multipart form upload (say, containing an audio file) while displaying a percentage progress.

## Structure
The basic HTML design should look like:
* Display form with file input field
* Display a title text field
* Display a status text paragraph "select file"
* Optionally display a submit button

## Specification
* When the user picks a file from their computer and optionally presses the submit button, the upload begins.
* While uploading, the status text paragraph should be updating with the current percentage complete at least once every 2 seconds.
* While uploading, the user should be able to enter text into the title text field.
* When the upload completes, the status text should display the path on the server to the saved file.

##  Requirements
* The upload should honor proxy settings on the browser
* The system must function behind a firewall that blocks all but port 80
* The server must support at least 2 concurrent uploads
* Any technology that can be web deployed to IE, Firefox, Safari, Chrome on any platform is supported


## Solution

* No Flash (yik!!)

### Basic Infrastrukture
* [Rails 2.3.5](http://rubyonrails.org/)
* [jQuery](http://railscasts.com/episodes/136-jquery) + [jRails](http://github.com/aaronchi/jrails)
* [Paperclip Plugin](http://github.com/thoughtbot/paperclip)
* [DefaultValue Plugin](http://blog.phusion.nl/2008/10/03/47/)
* [Blueprint CSS](http://blueprintcss.org/)

### The Magic
* Background File upload: [Ajaxupload]() http://valums.com/ajax-upload/
* Upload Progress count: [Apache-upload-progress-module module](http://github.com/mpokrywka/apache-upload-progress-module

### Deployment
* Apache + passenger
* capistrano
* sqlLite DB
* git 

## Future Improvements
* HTML 5 features
* No extra Apache module

---------------------------------------

## A bit more detailed Howto:

get apachemodule: http://github.com/mpokrywka/apache-upload-progress-module
compile: `sudo apxs -c -i -a -Wc,-arch -Wc,ppc7400 -Wl,-arch -Wl,ppc7400  -Wc,-arch -Wc,x86_64 -Wl,-arch -Wl,x86_64 -Wc,-arch -Wc,i386 -Wl,-arch -Wl,i386 mod_upload_progress.c`
update apache conf and create vhost

create rails app
add plugins
  * paperclip
  * default value
  * jQuery
  * jRails
  
add blueprint

add asset controller
add asset model

add ajaxupload for paralell processing: http://valums.com/ajax-upload/

add ajax call to check upload progress

make it nice

deploy with capistrano and git+passenger: http://www.zorched.net/2008/06/17/capistrano-deploy-with-git-and-passenger/


---------------------------------------

## Further reading:
http://railsillustrated.com/screencast-file-uploads-progress-in-rails-passenger.html
http://drogomir.com/blog/2008/6/18/upload-progress-bar-with-mod_passenger-and-apache
http://drogomir.com/blog/2008/6/30/upload-progress-script-with-safari-support
http://www.therailsway.com/2009/4/23/uploading-files
http://github.com/drogus/jquery-upload-progress
http://adamelliot.com/posts/using-paperclip-with-datamapper-sinatra--2
http://casperfabricius.com/site/2009/03/26/uploading-multiple-files-with-progress-indicator-using-jquery-flash-and-rails/

## Other resources:
http://sourceforge.net/projects/uber-uploader/
http://www.sibsoft.net/xupload.html
http://encodable.com/filechucker/
PHP5: http://talks.php.net/show/afup06/22
Flash: http://github.com/digitarald/digitarald-fancyupload
flashless uploads: http://code.google.com/p/noswfupload/
mutiple: http://webreflection.blogspot.com/2009/03/safari-4-multiple-upload-with-progress.html
html5:    http://rakaz.nl/2009/08/uploading-multiple-files-using-html5.html
sinatra:  http://serverfault.com/questions/111721/how-can-i-do-a-large-file-upload-using-sinatra-haml-nginx-and-passenger
uuid:       http://ariejan.net/2008/08/12/ruby-on-rails-uuid-as-your-activerecord-primary-key/
nice lists: http://print.wordpress.com/2006/02/22/css-beautifully-numbered-lists/
nice Fileupload style: http://www.quirksmode.org/dom/inputfile.html