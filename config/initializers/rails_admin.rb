# frozen_string_literal: true

RailsAdmin.config do |config|
  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == CancanCan ==
  config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  # config.actions do
  #  dashboard                     # mandatory
  #  index                         # mandatory
  #  new
  #  export
  #  bulk_delete
  #  show
  #  edit
  #  delete
  #  show_in_app
  # end
  ## With an audit adapter, you can add:
  # history_index
  # history_show
  config.included_models = [Guest, Hotel, Hotelday, Hotelprice, Reserved, Role, User]

  config.main_app_name = %w[予約管理システム 管理サイト]

  config.model 'Guest' do
    LABEL_id = '宿泊者ID'
    LABEL_name = '宿泊者名'
    LABEL_Password_digest = '暗号化済パスワード'
    LABEL_Remember_token = '暗号化済アクセス'
    LABEL_created_at = '作成日時'
    LABEL_updated_at = '更新日時'
    list do
      field :id do
        label LABEL_id
      end
      field :name do
        label LABEL_name
      end
      field :password_digest do
        label LABEL_Password_digest
      end
      field :remember_token do
        label LABEL_Remember_token
      end
      field :created_at do
        label LABEL_created_at
      end
      field :updated_at do
        label LABEL_updated_at
      end
    end
  end

  config.model 'Hotel' do
    LABEL_id = 'ホテルID'
    LABEL_Bestname = '１等室名'
    LABEL_Richname = '2等室名'
    LABEL_Fourthname = '3等室名'
    LABEL_Doublename = '4等室名'
    LABEL_Mails = 'メールアドレス'
    LABEL_Address = '住所'
    LABEL_Imgname = '画像名'
    LABEL_created_at = '作成日時'
    LABEL_updated_at = '更新日時'

    list do
      field :id do
        label LABEL_id
      end
      field :bestname do
        label LABEL_Bestname
      end
      field :richname do
        label LABEL_Richname
      end
      field :fourthname do
        label LABEL_Fourthname
      end
      field :doublename do
        label LABEL_Doublename
      end
      field :mails do
        label LABEL_Mails
      end
      field :address do
        label LABEL_Address
      end
      field :imgname do
        label LABEL_Imgname
      end
      field :created_at do
        label LABEL_created_at
      end
      field :updated_at do
        label LABEL_updated_at
      end
    end
  end

  config.model 'Hotelday' do
    LABEL_id = '権限ID'
    LABEL_Hotel = 'ホテルID'
    LABEL_Bestvacant = '１等室'
    LABEL_Richvacant = '2等室'
    LABEL_Fourthvacant = '3等室'
    LABEL_Doublevacant = '4等室'
    LABEL_Days = '予約日'
    LABEL_created_at = '作成日時'
    LABEL_updated_at = '更新日時'

    list do
      field :id do
        label LABEL_id
      end
      field :hotel_id do
        label LABEL_Hotel
      end
      field :bestvacant do
        label LABEL_Bestvacant
      end
      field :richvacant do
        label LABEL_Richvacant
      end
      field :fourthvacant do
        label LABEL_Fourthvacant
      end
      field :doublevacant do
        label LABEL_Doublevacant
      end
      field :days do
        label LABEL_Days
      end
      field :created_at do
        label LABEL_created_at
      end
      field :updated_at do
        label LABEL_updated_at
      end
    end
  end

  config.model 'Hotelprice' do
    LABEL_id = '権限ID'
    LABEL_Hotel = 'ホテルID'
    LABEL_Bestprice = '１等室'
    LABEL_Richprice = '2等室'
    LABEL_Fourthprice = '3等室'
    LABEL_Doubleprice = '4等室'
    LABEL_Newday = '更新日'
    LABEL_created_at = '作成日時'
    LABEL_updated_at = '更新日時'

    list do
      field :id do
        label LABEL_id
      end
      field :hotel_id do
        label LABEL_Hotel
      end
      field :bestprice do
        label LABEL_Bestprice
      end
      field :richprice do
        label LABEL_Richprice
      end
      field :fourthprice do
        label LABEL_Fourthprice
      end
      field :doubleprice do
        label LABEL_Doubleprice
      end
      field :newday do
        label LABEL_Newday
      end
      field :created_at do
        label LABEL_created_at
      end
      field :updated_at do
        label LABEL_updated_at
      end
    end
  end

  config.model 'Reserved' do
    LABEL_id = '予約ID'
    LABEL_Guest = 'ゲストID'
    LABEL_Hotel = 'ホテルID'
    LABEL_Stayday = '宿泊日数'
    LABEL_Room = '部屋'
    LABEL_Guestnum = '宿泊人数'
    LABEL_Reservedday = '宿泊日'
    LABEL_created_at = '作成日時'
    LABEL_updated_at = '更新日時'
    list do
      field :id do
        label LABEL_id
      end
      field :guest_id do
        label LABEL_Guest
      end
      field :hotel_id do
        label LABEL_Hotel
      end
      field :stayday do
        label LABEL_Stayday
      end
      field :guestnum do
        label LABEL_Guestnum
      end
      field :reservedday do
        label LABEL_Reservedday
      end
      field :created_at do
        label LABEL_created_at
      end
      field :updated_at do
        label LABEL_updated_at
      end
    end
  end

  config.model 'Role' do
    LABEL_id = '権限ID'
    LABEL_name = '権限名'
    LABEL_created_at = '作成日時'
    LABEL_updated_at = '更新日時'
    list do
      field :id do
        label LABEL_id
      end
      field :name do
        label LABEL_name
      end
      field :created_at do
        label LABEL_created_at
      end
      field :updated_at do
        label LABEL_updated_at
      end
    end
  end

  config.model 'User' do
    LABEL_id = 'ユーザID'
    LABEL_email = 'メールアドレス'
    LABEL_admin = '管理者フラグ'
    LABEL_role = '権限'
    LABEL_created_at = '作成日時'
    LABEL_updated_at = '更新日時'

    # ここに指定した項目が表示される。include_all_fieldsをすれば全て表示。
    list do
      field :id do
        label LABEL_id
      end
      field :email do
        label LABEL_email
      end
      field :admin do
        label LABEL_admin
      end
      include_fields :role do
        label LABEL_role
      end
      field :created_at do
        label LABEL_created_at
      end
      field :updated_at do
        label LABEL_updated_at
      end
    end
  end
end
