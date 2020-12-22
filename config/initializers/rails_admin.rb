
require Rails.root.join("lib", "rails_admin", "show_store.rb")
RailsAdmin::Config::Actions.register(RailsAdmin::Config::Actions::ShowStore)

RailsAdmin.config do |config|
  config.authenticate_with do
    warden.authenticate! scope: :user
  end

  config.current_user_method(&:current_user)

  config.actions do
    dashboard
    index
    new
    export
    bulk_delete

    # show mac dinh cua rails admin se khong dc dung trong show store, nhung van duoc dung trong show book
    show do
      except Store
    end

    # phan show cua store se duoc custom nhung khong anh huong den show cua book
    show_store do
      only Store
    end

    edit
    delete
    show_in_app
  end
end
