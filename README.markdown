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
I came up with a small & simple rails app called *_The Traffic Machine_ - a demonstration of background File Upload with Progress Bar*.

According to the specs, two major issues had to be solved: 
1. upload the file in background, while user enters additional title/comment/text to the file
2. get the upload progress and show it to the user

Usually, Flash solutions address those problems, but bring other disadvantages as well (wrong version/not installed/disabled). So I was looking for a solution without Flash. The latest specs of HTML5 give some further possibilities as well, but are not supported by majority of current web browsers (greetings to IE - ahhrgg!!!). *See sources at the bottom for further info*

Luckily, I didn't had to reinvent the wheel, as there are already good solutions for both problems out there.  For the
background upload, [Ajaxupload](http://valums.com/ajax-upload/) looked just fine for me. It's a jQuery implementation
of uploading a file to a hidden iFrame which happens in background and doesn't block the user from adding additional infromation.

To track the upload progress, I used the [Apache-upload-progress Module](http://github.com/mpokrywka/apache-upload-progress-module),
which adds an access point to Apache, so you can easily retrieve the total and uploaded file size in JSON format.



### Basic Infrastrukture
* [Rails 2.3.5](http://rubyonrails.org/)
* [jQuery](http://railscasts.com/episodes/136-jquery) + [jRails](http://github.com/aaronchi/jrails)
* [Paperclip Plugin](http://github.com/thoughtbot/paperclip)
* [DefaultValue Plugin](http://blog.phusion.nl/2008/10/03/47/)
* [Blueprint CSS](http://blueprintcss.org/)
* [github.com/rngtng](http://github.com/rngtng/FileUploadProgress) 
* sqlLite DB


### The Magic
* Background File upload: [Ajaxupload](http://valums.com/ajax-upload/) 
* Upload Progress count: [Apache-upload-progress-module](http://github.com/mpokrywka/apache-upload-progress-module)


### Deployment
* Apache 2 + [Passenger Module](http://www.modrails.com/)
* capistrano


## Future Improvements
* add HTML 5 features (Drag'n Drop, multiple??)
* Get rid of Apache module
* better error handling
* fix *hover* for file select button


## A quick step by step Howto:

get apachemodule, compile with: 
`sudo apxs -c -i -a -Wc,-arch -Wc,ppc7400 -Wl,-arch -Wl,ppc7400  -Wc,-arch -Wc,x86_64 -Wl,-arch -Wl,x86_64 -Wc,-arch -Wc,i386 -Wl,-arch -Wl,i386 mod_upload_progress.c`

update apache conf and create vhost

create rails app
add plugins

  * paperclip:
     `config.gem 'paperclip', :source => 'http://gemcutter.org'`
  * default value: 
     `script/plugin install git://github.com/FooBarWidget/default_value_for.git`
  * jQuery + jRails:
      `script/plugin install git://github.com/aaronchi/jrails.git`
  
add blueprint css files
add basic html layout
add asset controller
add asset model, add [uuid](http://ariejan.net/2008/08/12/ruby-on-rails-uuid-as-your-activerecord-primary-key/)
add tests
add [ajaxupload](http://valums.com/ajax-upload/) for background upload
add jQuery Ajax call to check upload progress
finish it up and make it nice

deploy [with capistrano and git+passenger](http://www.zorched.net/2008/06/17/capistrano-deploy-with-git-and-passenger/) 


## Further reading and other resources:
* <http://railsillustrated.com/screencast-file-uploads-progress-in-rails-passenger.html>
* <http://drogomir.com/blog/2008/6/18/upload-progress-bar-with-mod_passenger-and-apache>
* <http://drogomir.com/blog/2008/6/30/upload-progress-script-with-safari-support>
* <http://www.therailsway.com/2009/4/23/uploading-files)>
* <http://github.com/drogus/jquery-upload-progress>
* <http://adamelliot.com/posts/using-paperclip-with-datamapper-sinatra--2>
* <http://casperfabricius.com/site/2009/03/26/uploading-multiple-files-with-progress-indicator-using-jquery-flash-and-rails>
* <http://sourceforge.net/projects/uber-uploader>
* <http://www.sibsoft.net/xupload.html>
* <http://encodable.com/filechucker>
* <http://talks.php.net/show/afup06/22> - PHP5
* <http://github.com/digitarald/digitarald-fancyupload> - with Flash
* <http://code.google.com/p/noswfupload> - without Flash
* <http://webreflection.blogspot.com/2009/03/safari-4-multiple-upload-with-progress.html> - Mutiple Files
* <http://rakaz.nl/2009/08/uploading-multiple-files-using-html5.html> - HTML5
* <http://serverfault.com/questions/111721/how-can-i-do-a-large-file-upload-using-sinatra-haml-nginx-and-passenger> - Sinatra
* <http://www.quirksmode.org/dom/inputfile.html> - nice Fileupload style
