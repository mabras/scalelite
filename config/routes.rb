# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  scope 'bigbluebutton/api', as: 'bigbluebutton_api', format: false, defaults: { format: 'xml' } do
    get '/', to: 'bigbluebutton_api#index'
    get 'isMeetingRunning', to: 'bigbluebutton_api#is_meeting_running', as: :is_meeting_running
    get 'getMeetingInfo', to: 'bigbluebutton_api#get_meeting_info', as: :get_meeting_info
    get 'getMeetings', to: 'bigbluebutton_api#get_meetings', as: :get_meetings
    match 'create', to: 'bigbluebutton_api#create', via: [:get, :post]
    get 'end', to: 'bigbluebutton_api#end'
    get 'join', to: 'bigbluebutton_api#join'
    get 'getRecordings', to: 'bigbluebutton_api#get_recordings', as: :get_recordings
    get 'publishRecordings', to: 'bigbluebutton_api#publish_recordings', as: :publish_recordings
    get 'updateRecordings', to: 'bigbluebutton_api#update_recordings', as: :update_recordings
    get 'deleteRecordings', to: 'bigbluebutton_api#delete_recordings', as: :delete_recordings
  end

  scope 'scalelite/api', as: 'scalelite_api', format: false, defaults: { format: 'xml' } do
    get '/', to: 'scalelite_api#index'
    get 'getServers', to: 'scalelite_api#get_servers'
    get 'getServerInfo', to: 'scalelite_api#get_server_info'
    get 'addServer', to: 'scalelite_api#add_server'
    get 'removeServer', to: 'scalelite_api#remove_server'
    get 'enableServer', to: 'scalelite_api#enable_server'
    get 'disableServer', to: 'scalelite_api#disable_server'
    get 'setLoadMultiplier', to: 'scalelite_api#set_load_multiplier'
  end

  get 'health_check', to: 'health_check#all'

  match '*any', via: :all, to: 'errors#unsupported_request'
  root to: 'errors#unsupported_request', via: :all
end
