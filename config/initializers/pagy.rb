require 'pagy/extras/bootstrap'

require 'pagy/extras/items'
Pagy::VARS[:items_param] = :items    # default
Pagy::VARS[:max_items]   = 100       # default

Pagy::VARS[:items] = 18
Pagy::VARS[:size]       = [1,4,4,1]                       # default
Pagy::VARS[:page_param] = :page                           # default
Pagy::VARS[:params]     = {}                              # default
Pagy::VARS[:anchor]     = '#anchor'                       # example
Pagy::VARS[:link_extra] = 'data-remote="true"'            # exampraille