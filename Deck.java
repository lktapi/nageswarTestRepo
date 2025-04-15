import java.util.*;

public class Deck
{
    ArrayList<Card> deck;
    public Deck ()
    {
         deck = new ArrayList<Card>();
    }

     public Deck (int capacity)
    {
        deck = new ArrayList<Card>(capacity);
    }

    public int getNumCards ()
    {
        return deck.size();
    }

    public boolean isEmpty () 
    {
        return deck.isEmpty();
    }

    public void add (Card card) 
    {
        deck.add(0,card);
    }

    public Card takeTop() 
    {
        return deck.remove(0);
    }

    public void shuffle ()
    {
        Collections.shuffle(deck);
    }

    public void sort ()
    {
        Collections.sort(deck);
    }

    public String toString ()
    { 
         return (deck.toString()+ "\n");
    }
}
