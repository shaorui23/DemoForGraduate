# -*- encoding : utf-8 -*-
# RailsAdmin config file. Generated on January 06, 2012 11:21
# See github.com/sferik/rails_admin for more informations

RailsAdmin.config do |config|

  # If your default_local is different from :en, uncomment the following 2 lines and set your default locale here:
  #require 'i18n'
  #I18n.default_locale = 'zh-CN'

  config.current_user_method { current_user } # auto-generated
  
  # If you want to track changes on your models:
  # config.audit_with :history, User
  
  # Or with a PaperTrail: (you need to install it first)
  # config.audit_with :paper_trail, User
  
  # Set the admin name here (optional second array element will appear in a beautiful RailsAdmin red ©)
  config.main_app_name = ['Redis数据库管理', 'Web']
  config.models do
    fields_of_type :datetime do
      strftime_format "%Y-%m-%d"
    end
  end
  # or for a dynamic name:
  # config.main_app_name = Proc.new { |controller| [Rails.application.engine_name.titleize, controller.params['action'].titleize] }


  #  ==> Global show view settings
  # Display empty fields in show views
  # config.compact_show_view = false

  #  ==> Global list view settings
  # Number of default rows per-page:
  # config.default_items_per_page = 20

  #  ==> Included models
  # Add all excluded models here:
  # config.excluded_models = []

  # Add models here if you want to go 'whitelist mode':
  # config.included_models = []

  # Application wide tried label methods for models' instances
  # config.label_methods << :description # Default is [:name, :title]

  #  ==> Global models configuration
  # config.models do
  #   # Configuration here will affect all included models in all scopes, handle with care!
  #
  #   list do
  #     # Configuration here will affect all included models in list sections (same for show, export, edit, update, create)
  #
  #     fields_of_type :date do
  #       # Configuration here will affect all date fields, in the list section, for all included models. See README for a comprehensive type list.
  #     end
  #   end
  # end
 #config.model Team do
 #  edit do
 #    team = Team.find(params[:id]) 
 #    team.on_base << "show"
 #  end
 #end
 #
  config.model Article do
    list do
      field :title
      field :content
      field :created_at do
        strftime_format "%Y-%m"
      end
    end
  end

  config.model Team do
    #object_label_method :on_base
    #label "Fuck your team"

    create do
      field :redis_on_base do
        label "Redis Object - OnBase"
      end
      field :redis_outfielders
    end

    show do
      field :id
      field :redis_on_base do
        label "On Base"
      end
      field :redis_outfielders do
        label "OutFielders"
      end
    end

    edit do
      field :redis_on_base
      field :redis_outfielders
    end

    list do
      field :id
      field :redis_on_base do
        label "On Base"
      end
      field :redis_outfielders do
        label "OutFielders"
      end
    end
  end
  #
  #  ==> Model specific configuration
  # Keep in mind that *all* configuration blocks are optional.
  # RailsAdmin will try his best to provide the best defaults for each section, for each field.
  # Try to override as few things as possible, in the most generic way. Try to avoid setting labels for models and attributes, use ActiveRecord I18n API instead.
  # Less code is better code!
  # config.model MyModel do
  #   # Cross-section field configuration
  #   object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #   label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #   label_plural 'My models'      # Same, plural
  #   weight -1                     # Navigation priority. Bigger is higher.
  #   parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #   navigation_label              # Sets dropdown entry's name in navigation. Only for parents!
  #   # Section specific configuration:
  #   list do
  #     filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #     items_per_page 100    # Override default_items_per_page
  #     sort_by :id           # Sort column (default is primary key)
  #     sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     # Here goes the fields configuration for the list view
  #   end
  # end

  # Your model's configuration, to help you get started:

  # All fields marked as 'hidden' won't be shown anywhere in the rails_admin unless you mark them as visible. (visible(true))

end
