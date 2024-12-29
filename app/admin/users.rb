# edited by my
#
ActiveAdmin.register User do
  permit_params :email, :phone_number, :created_at, :updated_at, :sign_in_count

  index do
    selectable_column
    id_column
    column :email
    column :phone_number
    column :created_at
    column :updated_at
    column :sign_in_count
    actions
  end

  filter :email
  filter :phone_number
  filter :created_at
  filter :updated_at
end
