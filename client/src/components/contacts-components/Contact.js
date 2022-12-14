import React, { useContext } from "react";
import { CSSTransition, TransitionGroup } from "react-transition-group";
import ContactContext from "../../context/contact/contactContext";
import LoadingSpinner from "../layout/LoadingSpinner";
import ContactItem from "./ContactItem";
// import LoadingSpinner from "../layout/LoadingSpinner";
function Contact() {
	const contactContext = useContext(ContactContext);

	const { contacts, filtered, getContacts, loading } = contactContext;

	React.useEffect(() => {
		getContacts();
		// eslint-disable-next-line
	}, []);

	if (contacts !== null && contacts.length === 0 && !loading) {
		return <h4>Please add a contact</h4>;
	}

	return (
		<>
			{contacts !== null && !loading ? (
				<TransitionGroup>
					{filtered !== null
						? filtered.map((contact) => (
								<CSSTransition
									key={contact._id}
									timeout={500}
									classNames="item"
								>
									<ContactItem contact={contact} />
								</CSSTransition>
						  ))
						: contacts.map((contact) => (
								<CSSTransition
									key={contact._id}
									timeout={500}
									classNames="item"
								>
									<ContactItem contact={contact} />
								</CSSTransition>
						  ))}
				</TransitionGroup>
			) : (
				<LoadingSpinner />
			)}
		</>
	);
}

export default Contact;
