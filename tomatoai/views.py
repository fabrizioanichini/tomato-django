from rest_framework import viewsets, filters
from django_filters.rest_framework import DjangoFilterBackend
from .models import Restaurant, Recipe, Ingredient
from .serializers import RestaurantSerializer, RecipeSerializer, IngredientSerializer

class RestaurantViewSet(viewsets.ModelViewSet):
    queryset = Restaurant.objects.all()
    serializer_class = RestaurantSerializer
    filter_backends = [DjangoFilterBackend, filters.SearchFilter]
    filterset_fields = ['recipes__name']
    search_fields = ['id', 'name', 'address']

class RecipeViewSet(viewsets.ModelViewSet):
    queryset = Recipe.objects.all()
    serializer_class = RecipeSerializer
    filter_backends = [DjangoFilterBackend, filters.SearchFilter]
    filterset_fields = ['restaurants__name', 'ingredients__name']
    search_fields = ['id', 'name']

class IngredientViewSet(viewsets.ModelViewSet):
    queryset = Ingredient.objects.all()
    serializer_class = IngredientSerializer
    filter_backends = [DjangoFilterBackend, filters.SearchFilter]
    filterset_fields = ['recipes__name', 'recipes__restaurants__name']
    search_fields = ['id', 'name']
