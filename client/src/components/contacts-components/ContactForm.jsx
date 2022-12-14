import React, { useContext } from "react";
import ContactContext from "../../context/contact/contactContext";

function ContactForm() {
	const contactContext = useContext(ContactContext);
	const { addContact, updateContact, clearContact, current } = contactContext;

	React.useEffect(() => {
		if (current !== null) {
			setContact(current);
		} else {
			setContact({
				name: "",
				email: "",
				phone: "",
				contact_type: "personal",
			});
		}
	}, [contactContext, current]);

	const [contact, setContact] = React.useState({
		name: "",
		email: "",
		phone: "",
		contact_type: "personal",
	});

	const { name, email, phone, contact_type } = contact;
	const onChange = (e) =>
		setContact({ ...contact, [e.target.name]: e.target.value });
	const onSubmit = (e) => {
		e.preventDefault();
		if (current === null) {
			addContact(contact);
		} else {
			updateContact(contact);
		}
		console.log("Here is a new contact ===>", contact);
		clearAll();
	};
	const clearAll = () => {
		clearContact();
	};

	return (
		<>
			<form onSubmit={onSubmit}>
				<h2 className="text-primary">
					{current ? "Edit Contact" : "Add A New Contact to Keeper"}
				</h2>
				<input
					type="text"
					placeholder="name"
					name="name"
					value={name}
					onChange={onChange}
				/>
				<input
					type="email"
					placeholder="Email Address"
					name="email"
					value={email}
					onChange={onChange}
				/>
				<input
					type="text"
					placeholder="Phone Number"
					name="phone"
					value={phone}
					onChange={onChange}
				/>
				<h5>Contact Type</h5>
				<input
					type="radio"
					name="contact_type"
					value="personal"
					ckecked={contact_type === "personal"}
					onChange={onChange}
				/>{" "}
				Personal{" "}
				<input
					type="radio"
					name="contact_type"
					value="professional"
					ckecked={contact_type === "professional"}
					onChange={onChange}
				/>{" "}
				Professional{" "}
				<div className="submit-btn">
					<input
						type="submit"
						value={current ? "Edit Contact" : "Add A New Contact"}
						className="btn btn-success btn-block"
					/>
				</div>
				{current && (
					<div className="clear-btn">
						<button className="btn btn-danger btn-block" onClick={clearAll}>
							Clear
						</button>
					</div>
				)}
			</form>
		</>
	);
}

export default ContactForm;
