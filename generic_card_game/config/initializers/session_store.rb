if Rails.env === 'production'
  Rails.application.config.session_store :cookie_store, key: '_generic_card_game', domain: 'generic_card_game-json-api'
else
  Rails.application.config.session_store :cookie_store, key: '_generic_card_game'
end