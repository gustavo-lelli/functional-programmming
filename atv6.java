import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.*;
import java.util.stream.Collectors;

public class Main {
	public static void main(String[] args) throws IOException {
		// Lê os parâmetros
		Scanner scanner = new Scanner(System.in);
		int n1 = scanner.nextInt();
		int n2 = scanner.nextInt();
		int n3 = scanner.nextInt();
		int n4 = scanner.nextInt();

		// Lê o arquivo CSV
		List<String> lines = Files.readAllLines(Paths.get("dados.csv"));

		// Converte as linhas em objetos País
		List<Pais> paises = lines.stream()
			.map(Pais::new)
			.collect(Collectors.toList());

		// Soma os "Active" de todos os países em que "Confirmed" for maior ou igual a n1
		int somaActive = paises.stream()
			.filter(p -> p.confirmed >= n1)
			.mapToInt(p -> p.active)
			.sum();
		System.out.println(somaActive);

		// Soma as "Deaths" dos n3 países com menores valores de "Confirmed" dentre os n2 países com maiores valores de "Active"
		int somaDeaths = paises.stream()
			.sorted(Comparator.comparingInt(p -> -p.active))
			.limit(n2)
			.sorted(Comparator.comparingInt(p -> p.confirmed))
			.limit(n3)
			.mapToInt(p -> p.deaths)
			.sum();
		System.out.println(somaDeaths);

		// Printa os n4 países com os maiores valores de "Confirmed" em ordem alfabética
		List<String> topCountries = paises.stream()
			.sorted(Comparator.comparingInt(p -> -p.confirmed))
			.limit(n4)
			.map(p -> p.country)
			.sorted()
			.collect(Collectors.toList());
		topCountries.forEach(System.out::println);
	}
}

class Pais {
	String country;
	int confirmed;
	int deaths;
	int recovery;
	int active;

	Pais(String csvLine) {
		String[] data = csvLine.split(",");
		this.country = data[0];
		this.confirmed = Integer.parseInt(data[1]);
		this.deaths = Integer.parseInt(data[2]);
		this.recovery = Integer.parseInt(data[3]);
		this.active = Integer.parseInt(data[4]);
	}
}