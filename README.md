# taskman

taskman is a simple, low-friction task manager. it condenses your entire workday into two categories: `meetings` and `tasks`. taskman gives a few command-line utilities to help support you and make life easier.

## installation

provided you have ruby, gem, and bundler installed, installation is a breeze:

`$ git clone https://github.com/mxtetrachord/taskman && cd taskman/`

`$ bundle install`

and you're done!

## cli usage

`$ rake tasks` generates a space to write your tasks for the day. they'll be placed in `tasks/week-of-#{ most_recent_monday }.md`. you'll have headings for each day you run the task, in standard markdown.

`$ rake meeting WHOM` generates a new meeting log. taskman's idea of meeting logs is simple: each person with whom you have a meeting gets their own markdown file. running this rake task will create a file for this new person; or, if a file exists already, it will just append the date heading.

`$ rake test` will run tests.

