pretty_table
============
Turns multidimensional data into a pretty table.

Example
-------
Top 10 countries by population from the CIA World Factbook https://www.cia.gov/library/publications/the-world-factbook/rankorder/2119rank.html

This:

    headers = [ 'Country', 'Population', 'Date of Information' ]
    data    = [ [ 'China',         1336718015, 'July 2011 est.' ],
                [ 'India',         1189172906, 'July 2011 est.' ],
                [ 'United States',  313232044, 'July 2011 est.' ],
                [ 'Indonesia',      245613043, 'July 2011 est.' ],
                [ 'Brazil',         203429773 ],
                [ 'Pakistan',       187342721, 'July 2011 est.' ],
                [ 'Bangladesh',     158570535, 'July 2011 est.' ],
                [ 'Nigeria',        155215573 ],
                [ 'Russia',         138739892, 'July 2011 est.' ],
                [ 'Japan',          126475664, 'July 2011 est.' ] ]
    puts PrettyTable.new(data, headers).to_s

Makes:

       Country    |  Population   | Date of Information
    --------------+---------------+--------------------
    China         | 1,336,718,015 | July 2011 est.     
    India         | 1,189,172,906 | July 2011 est.     
    United States |   313,232,044 | July 2011 est.     
    Indonesia     |   245,613,043 | July 2011 est.     
    Brazil        |   203,429,773 |                    
    Pakistan      |   187,342,721 | July 2011 est.     
    Bangladesh    |   158,570,535 | July 2011 est.     
    Nigeria       |   155,215,573 |                    
    Russia        |   138,739,892 | July 2011 est.     
    Japan         |   126,475,664 | July 2011 est.

Contributing to pretty_table
---------------------------- 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

Copyright
---------
Copyright (c) 2011 John Wulff. See LICENSE.txt for
further details.

