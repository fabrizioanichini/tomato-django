from django.urls import reverse
from rest_framework import status
from rest_framework.test import APITestCase
from .models import Restaurant, Recipe, Ingredient

class RestaurantTests(APITestCase):

    def test_filter_restaurants_by_recipe(self):
        recipe = Recipe.objects.create(name='Ricetta di test')
    
        restaurant = Restaurant.objects.create(name='Ristorante di Prova', address='Via Roma')
        restaurant.recipes.add(recipe)
        restaurant.save()

        url = reverse('restaurant-list') + '?recipes__name=' + recipe.name
        response = self.client.get(url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(len(response.data), 1)

    def test_search_restaurant_by_id(self):
        restaurant = Restaurant.objects.create(name='Ristorante Unico di Test', address='Via Roma')

        url = reverse('restaurant-list') + '?search=' + str(restaurant.id)
        response = self.client.get(url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(len(response.data), 1) 
 
    def test_get_restaurants(self):
        url = reverse('restaurant-list')
        response = self.client.get(url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_create_restaurant(self):
        data = {
            'name': 'Ristorante di Test',
            'description': 'Descrizione di prova',
            'address': 'Via Roma',
            'phone_number': '0553253098',
        }
        url = reverse('restaurant-list')
        response = self.client.post(url, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(Restaurant.objects.count(), 1)
        self.assertEqual(Restaurant.objects.get().name, 'Ristorante di Test')

    def test_get_restaurant(self):
        restaurant = Restaurant.objects.create(
            name='Ristorante di Test 2',
            description='Descrizione di Test 2'
        )
        url = reverse('restaurant-detail', args=[restaurant.id])
        response = self.client.get(url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_update_restaurant(self):
        restaurant = Restaurant.objects.create(
            name='Ristorante di Test 3',
            description='Descrizione di Test 3',
            address='Via Roma 12',
            phone_number='0553253098',
        )
        data = {
            'name': 'Ristorante Aggiornato',
            'description': 'Descrizione Aggiornata',
            'address': 'Via Roma 12',
            'phone_number': '0553253098',
        }
        url = reverse('restaurant-detail', args=[restaurant.id])
        response = self.client.put(url, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        updated = Restaurant.objects.get(pk=restaurant.id)
        self.assertEqual(updated.name, data['name'])

    def test_delete_restaurant(self):
        restaurant = Restaurant.objects.create(
            name='Ristorante di Test 4',
            description='Descrizione di Test 4'
        )
        url = reverse('restaurant-detail', args=[restaurant.id])
        response = self.client.delete(url)
        self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)
        self.assertEqual(Restaurant.objects.count(), 0)



class RecipeTests(APITestCase):

    def test_filter_recipes_by_ingredient(self):
        ingredient = Ingredient.objects.create(name='Ingrediente di Test')
       
        recipe = Recipe.objects.create(name='Ricetta di Test')
        recipe.ingredients.add(ingredient)
        recipe.save()

        url = reverse('recipe-list') + '?ingredients__name=' + ingredient.name
        response = self.client.get(url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(len(response.data), 1)

    def test_search_recipe_by_id(self):
        recipe = Recipe.objects.create(name='Ricetta unica di Test')

        url = reverse('recipe-list') + '?search=' + str(recipe.id)
        response = self.client.get(url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(len(response.data), 1) 

    def test_get_recipes(self):
        url = reverse('recipe-list')
        response = self.client.get(url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_create_recipe(self):
        data = {
            'name': 'Ricetta di Test',
            'description': 'Descrizione di test',
            'instructions': 'Istruzioni di Test'
        }
        url = reverse('recipe-list')
        response = self.client.post(url, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(Recipe.objects.count(), 1)
        self.assertEqual(Recipe.objects.get().name, 'Ricetta di Test')

    def test_get_recipe(self):
        recipe = Recipe.objects.create(
            name='Ricetta di Test 2',
            description='Descrizione di Test 2',
            instructions='Istruzioni di Test 2'
        )
        url = reverse('recipe-detail', args=[recipe.id])
        response = self.client.get(url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_update_recipe(self):
        recipe = Recipe.objects.create(
            name='Ricetta di Test 3',
            description='Descrizione di Test 3',
            instructions='Istruzioni di Test 3'
        )
        data = {
            'name': 'Ricetta aggiornata',
            'description': 'Descrizione aggiornata',
            'instructions': 'Istruzioni aggiornate'
        }
        url = reverse('recipe-detail', args=[recipe.id])
        response = self.client.put(url, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        updated = Recipe.objects.get(pk=recipe.id)
        self.assertEqual(updated.name, 'Ricetta aggiornata')

    def test_delete_recipe(self):
        recipe = Recipe.objects.create(
            name='Ricetta di Test 4',
            description='Descrizione di Test 4',
            instructions='Instruzioni di Test 4'
        )
        url = reverse('recipe-detail', args=[recipe.id])
        response = self.client.delete(url)
        self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)
        self.assertEqual(Recipe.objects.count(), 0)



class IngredientTests(APITestCase):
    def test_search_ingredient_by_id(self):
        ingredient = Ingredient.objects.create(name='Ingrediente unico di test')

        url = reverse('ingredient-list') + '?search=' + str(ingredient.id)
        response = self.client.get(url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(len(response.data), 1)

    def test_filter_ingredients_by_restaurant_recipe(self):
        restaurant = Restaurant.objects.create(name='Ristorante di test')
        recipe = Recipe.objects.create(name='Ricetta di Test')
        ingredient = Ingredient.objects.create(name='Ingrediente di Test')

        recipe.ingredients.add(ingredient)
        restaurant.recipes.add(recipe)
        recipe.save()
        restaurant.save()

        url = reverse('ingredient-list') + '?recipes__restaurants__name=' + restaurant.name
        response = self.client.get(url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(len(response.data), 1)

    def test_get_ingredients(self):
        url = reverse('ingredient-list')
        response = self.client.get(url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_create_ingredient(self):
        data = {
            'name': 'Ingrediente di Test',
            'description': 'Descrizione di Test'
        }
        url = reverse('ingredient-list')
        response = self.client.post(url, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(Ingredient.objects.count(), 1)
        self.assertEqual(Ingredient.objects.get().name, 'Ingrediente di Test')

    def test_get_ingredient(self):
        ingredient = Ingredient.objects.create(
            name='Ingrediente di Test 2',
            description='Descrizione di Test 2'
        )
        url = reverse('ingredient-detail', args=[ingredient.id])
        response = self.client.get(url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_update_ingredient(self):
        ingredient = Ingredient.objects.create(
            name='Ingrediente di Test 3',
            description='Descrizione di Test 3'
        )
        data = {
            'name': 'Ingrediente aggiornato',
            'description': 'Descrizione aggiornata'
        }
        url = reverse('ingredient-detail', args=[ingredient.id])
        response = self.client.put(url, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        updated = Ingredient.objects.get(pk=ingredient.id)
        self.assertEqual(updated.name, 'Ingrediente aggiornato')

    def test_delete_ingredient(self):
        ingredient = Ingredient.objects.create(
            name='Ingrediente di Test 4',
            description='Descrizione di Test 4'
        )
        url = reverse('ingredient-detail', args=[ingredient.id])
        response = self.client.delete(url)
        self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)
        self.assertEqual(Ingredient.objects.count(), 0)