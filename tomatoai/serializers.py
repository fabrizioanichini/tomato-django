from rest_framework import serializers
from .models import Restaurant, Recipe, Ingredient

class RecipeSerializer(serializers.ModelSerializer):
    class Meta:
        model = Recipe
        fields = '__all__'

class IngredientSerializer(serializers.ModelSerializer):
    class Meta:
        model = Ingredient
        fields = '__all__'

class RestaurantSerializer(serializers.ModelSerializer):
    recipes = RecipeSerializer(many=True, read_only=True)

    class Meta:
        model = Restaurant
        fields = '__all__'
