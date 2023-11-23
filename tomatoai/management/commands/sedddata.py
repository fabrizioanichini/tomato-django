from django.core.management.base import BaseCommand
from tomatoai.models import Restaurant, Recipe, Ingredient
import random

class Command(BaseCommand):
    help = 'Popola dati per ristoranti, ricette, ingredienti'

    def handle(self, *args, **kwargs):
        self.stdout.write('Inizio...')

        # Restaurants
        for i in range(5): 
            restaurant = Restaurant.objects.create(
                name=f'Ristorante {i}',
                description=f'Descrizione per ristorante {i}',
                address=f'Indirizzo {i}',
                phone_number=f'12345678{i}'
            )

        # Ingredients
        ingredients = []
        for i in range(10):
            ingredient = Ingredient.objects.create(
                name=f'Ingrediente {i}',
                description=f'descrizione per ingrediente {i}'
            )
            ingredients.append(ingredient)

        # Recipes
        for i in range(10): 
            recipe = Recipe.objects.create(
                name=f'Ricetta {i}',
                description=f'Descrizione per ricetta {i}',
                instructions=f'Istruzioni per ricetta {i}'
            )
            
            recipe.restaurants.add(*random.sample(list(Restaurant.objects.all()), 2))
            recipe.ingredients.add(*random.sample(ingredients, 3))

        self.stdout.write(self.style.SUCCESS('Completato!'))
