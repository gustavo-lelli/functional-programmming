import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

class CountryData {
    String country;
    int confirmed;
    int deaths;
    int recovery;
    int active;

    CountryData(String country, int confirmed, int deaths, int recovery, int active) {
        this.country = country;
        this.confirmed = confirmed;
        this.deaths = deaths;
        this.recovery = recovery;
        this.active = active;
    }
}

public class Main {
    public static void main(String[] args) {
        try (BufferedReader br = new BufferedReader(new InputStreamReader(System.in))) {
            String[] input = br.readLine().split(" ");
            int n1 = Integer.parseInt(input[0]);
            int n2 = Integer.parseInt(input[1]);
            int n3 = Integer.parseInt(input[2]);
            int n4 = Integer.parseInt(input[3]);

            List<CountryData> countries = new ArrayList<>();

            try (BufferedReader fileReader = new BufferedReader(new FileReader("dados.csv"))) {
                String line;
                while ((line = fileReader.readLine()) != null) {
                    String[] data = line.split(",");
                    String country = data[0];
                    int confirmed = Integer.parseInt(data[1]);
                    int deaths = Integer.parseInt(data[2]);
                    int recovery = Integer.parseInt(data[3]);
                    int active = Integer.parseInt(data[4]);
                    countries.add(new CountryData(country, confirmed, deaths, recovery, active));
                }
            } catch (IOException e) {
                e.printStackTrace();
                return;
            }
            int sumActive = 0;
            for (CountryData country : countries) {
                if (country.confirmed >= n1) {
                    sumActive += country.active;
                }
            }
            System.out.println(sumActive);

            countries.sort(Comparator.comparingInt(country -> -country.active));
            List<CountryData> topN2ActiveCountries = countries.subList(0, Math.min(n2, countries.size()));
            
            topN2ActiveCountries.sort(Comparator.comparingInt(country -> country.confirmed));
            int sumDeaths = 0;
            for (int i = 0; i < Math.min(n3, topN2ActiveCountries.size()); i++) {
                sumDeaths += topN2ActiveCountries.get(i).deaths;
            }
            System.out.println(sumDeaths);

            countries.sort(Comparator.comparingInt(country -> -country.confirmed));
            List<CountryData> topN4ConfirmedCountries = countries.subList(0, Math.min(n4, countries.size()));
            
            List<String> topN4CountryNames = new ArrayList<>();
            for (CountryData country : topN4ConfirmedCountries) {
                topN4CountryNames.add(country.country);
            }
            Collections.sort(topN4CountryNames);
            
            for (String country : topN4CountryNames) {
                System.out.println(country);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
