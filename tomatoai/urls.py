from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import RestaurantViewSet, RecipeViewSet, IngredientViewSet

router = DefaultRouter()
router.register('restaurants', RestaurantViewSet)
router.register('recipes', RecipeViewSet)
router.register('ingredients', IngredientViewSet)

urlpatterns = [
    path('', include(router.urls)),
]