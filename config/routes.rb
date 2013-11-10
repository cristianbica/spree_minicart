Spree::Core::Engine.routes.draw do
  get 'minicart' => "minicart#show", as: :minicart
end
