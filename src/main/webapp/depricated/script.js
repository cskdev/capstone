// api url
const api_url =
	"https://api.postalpincode.in/pincode/532221";

// Defining async function
async function getapi(url) {
	
	// Storing response
	const response = await fetch(url);
	
	// Storing data in form of JSON
	var data = await response.json();
	console.log(data);
	if (response) {
		hideloader();
	}
	show(data);
}
// Calling that async function
getapi(api_url);

// Function to hide the loader
function hideloader() {
	document.getElementById('loading').style.display = 'none';
}
// Function to define innerHTML for HTML table
function show(data) {
	let tab =
		`<tr>
		<th>Name</th>
		<th>District</th>
		<th>Region</th>
		<th>State</th>
		</tr>`;
	
	// Loop to access all rows
	for (let r of data) {
		tab += `<tr>

         <td>${r.PostOffice.Name}</td>
	<td>${r.District}</td>
	<td>${r.Message}</td>
	<td>${r.State}</td>
	<td>${r}</td>
	<td>data</td>
</tr>`;
	}
	// Setting innerHTML as tab variable
	document.getElementById("addresses").innerHTML = tab;
}

